%% Modelagem e simula��o de um receptor RF com sinais LTE
% C�digo baseado no exemplo dispon�vel na p�gina:
% https://www.mathworks.com/help/lte/examples/
%modeling-and-testing-an-lte-rf-receiver.html
% Adaptado e atualizado por Ronny Mill�o [�ltima atualiza��o em 07-05-2017]
clear all
clc
%% Gera��o do sinal LTE
% Configura��o segundo a norme TS 136.101 para 25 REs (5 MHz), 64-QAM,
% aloca��o total
rmc = lteRMCDL('R.6');
rmc.OCNGPDSCHEnable = 'On';

% Gera��o de dados rand�micos
rng('default'); % Semente
data = randi([0 1], sum(rmc.PDSCH.TrBlkSizes),1);

% Gera��o de 1 frame
[tx, ~, info] = lteRMCDLTool(rmc, data);

% C�lculo do per�odo de amostragem e tamanho do frame
SamplePeriod = 1/info.SamplingRate;
FrameLength = length(tx);
%% Inicializa��o dos componentes de simula��o
% Filtro de transmiss�o, limitador de banda
FiltOrd = 32;
h = firpm(FiltOrd,[0 2.25e6*2*SamplePeriod 2.7e6*2*SamplePeriod 1],
[1 1 0 0]);
FilterDelaySamples = FiltOrd/2; % Atraso do filtro

% Modelo de propaga��o
SNRdB = 57;                 % Es/Noc [dB]
NocdBm = -98;               % Noc [dBm/15kHz]
NocdBW = NocdBm - 30;       % Noc [dBW/15kHz57]
SNR = 10^(SNRdB/10);        % linear [Es/Noc]
Es = SNR*(10^(NocdBW/10));  % linear [Es por RE]
FFTLength = info.Nfft;
SymbolPower = Es/double(FFTLength);

% N�mero de frames a serem simulados N>=1
N = 5;

% Pr�-aloca��o de mem�ria para os resultados 
% EVM n�o � medido no primeiro frame para evitar efeitos transientes
evmpeak = zeros(N-1,1);
evmrms = zeros(N-1,1);
%% Especifica��o do ambiente de simula��o
model = 'RFLTEReceiver';
disp('Starting Simulink');
open_system(model);
%% Modo acelerado de simula��o no Simulink
% Cria��o de espa�o tempor�rio para salvamento de dados
originalDir = pwd;
tempDir = tempname;
mkdir(tempDir);
cd(tempDir);
%% Configura��o dos par�metros do receptor
LNA_G = 30;
LNA_NF = 0;
LNA_IP3 = inf;

MIXER_G = 30;
MIXER_NF = 0;
MIXER_IP3 = inf;

BBA_G = 40;
BBA_NF = 0;
BBA_IP3 = inf;
%% Simula��o do primeiro frame
% Gera��o do vetor de tempo de simula��o
time = (0:FrameLength+FilterDelaySamples)*SamplePeriod;
% Adi��o do atraso do filtro no sinal de transmiss�o
txWaveform = timeseries([tx; tx(1:FilterDelaySamples+1)],time);

% Chamada ao modelo Simulink para a simula��o
% Desativamento do carregamento de estado inicial
set_param(model, 'LoadInitialState', 'off');
% Mensagem de acompanhamento
disp('Simulando');
% Simula��o no tempo definido
sim(model, time(end));
% Salvamento de estado do Simulink para o pr�ximo frame
xInitial = xFinal;

% Sincroniza��o do sinal recebido

% Corre��o em frequ�ncia
foffset_est = lteFrequencyOffset(rmc,rx);
rxFreqCorrected = lteFrequencyCorrect(rmc,rx,foffset_est);

% Sincroniza��o no tempo
offset = lteDLFrameOffset(rmc,rxFreqCorrected,'TestEVM');
rx = rx(1+offset:end,:);

disp('Primeiro frame simulado.');
%% Simula��o sucessiva de frames
% Carregamento do estado anterior do Simulink ap�s a simula�� do primeiro
% frame
% Ativa��o do carregamento de estado inicial no Simulink
set_param(model, 'LoadInitialState', 'on', 'InitialState','xInitial');
% Atualiza��o do vetor de transmiss�o com o atraso do filtro
RepeatFrame = [tx(FilterDelaySamples+1:end); tx(1:FilterDelaySamples+1)];
EVMalg.EnablePlotting = 'Off';
cec.PilotAverage = 'TestEVM';

for n = 2:N % Loop para executar os frames restantes
    % Gerando sinal de transmiss�o
    time = ( (n-1)*FrameLength+(0:FrameLength) + FilterDelaySamples)
    *SamplePeriod;
    txWaveform = timeseries(RepeatFrame,time);

    % Execu��o do ambiente de simula��o
    sim(model, time(end));
    disp('Frame simulado.');
    xInitial = xFinal; % Salvar estado
    
    % C�lculo e resultados da medi��o de EVM
    evmmeas = hPDSCHEVM(rmc,cec,rx,EVMalg);
    evmpeak(n-1) = evmmeas.Peak;
    evmrms(n-1) = evmmeas.RMS;
end
% Mensagem final
disp('�ltimo frame simulado.');