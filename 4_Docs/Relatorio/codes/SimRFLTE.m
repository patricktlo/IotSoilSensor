%% Modelagem e simulação de um receptor RF com sinais LTE
% Código baseado no exemplo disponível na página:
% https://www.mathworks.com/help/lte/examples/
%modeling-and-testing-an-lte-rf-receiver.html
% Adaptado e atualizado por Ronny Milléo [última atualização em 07-05-2017]
clear all
clc
%% Geração do sinal LTE
% Configuração segundo a norme TS 136.101 para 25 REs (5 MHz), 64-QAM,
% alocação total
rmc = lteRMCDL('R.6');
rmc.OCNGPDSCHEnable = 'On';

% Geração de dados randômicos
rng('default'); % Semente
data = randi([0 1], sum(rmc.PDSCH.TrBlkSizes),1);

% Geração de 1 frame
[tx, ~, info] = lteRMCDLTool(rmc, data);

% Cálculo do período de amostragem e tamanho do frame
SamplePeriod = 1/info.SamplingRate;
FrameLength = length(tx);
%% Inicialização dos componentes de simulação
% Filtro de transmissão, limitador de banda
FiltOrd = 32;
h = firpm(FiltOrd,[0 2.25e6*2*SamplePeriod 2.7e6*2*SamplePeriod 1],
[1 1 0 0]);
FilterDelaySamples = FiltOrd/2; % Atraso do filtro

% Modelo de propagação
SNRdB = 57;                 % Es/Noc [dB]
NocdBm = -98;               % Noc [dBm/15kHz]
NocdBW = NocdBm - 30;       % Noc [dBW/15kHz57]
SNR = 10^(SNRdB/10);        % linear [Es/Noc]
Es = SNR*(10^(NocdBW/10));  % linear [Es por RE]
FFTLength = info.Nfft;
SymbolPower = Es/double(FFTLength);

% Número de frames a serem simulados N>=1
N = 5;

% Pré-alocação de memória para os resultados 
% EVM não é medido no primeiro frame para evitar efeitos transientes
evmpeak = zeros(N-1,1);
evmrms = zeros(N-1,1);
%% Especificação do ambiente de simulação
model = 'RFLTEReceiver';
disp('Starting Simulink');
open_system(model);
%% Modo acelerado de simulação no Simulink
% Criação de espaço temporário para salvamento de dados
originalDir = pwd;
tempDir = tempname;
mkdir(tempDir);
cd(tempDir);
%% Configuração dos parâmetros do receptor
LNA_G = 30;
LNA_NF = 0;
LNA_IP3 = inf;

MIXER_G = 30;
MIXER_NF = 0;
MIXER_IP3 = inf;

BBA_G = 40;
BBA_NF = 0;
BBA_IP3 = inf;
%% Simulação do primeiro frame
% Geração do vetor de tempo de simulação
time = (0:FrameLength+FilterDelaySamples)*SamplePeriod;
% Adição do atraso do filtro no sinal de transmissão
txWaveform = timeseries([tx; tx(1:FilterDelaySamples+1)],time);

% Chamada ao modelo Simulink para a simulação
% Desativamento do carregamento de estado inicial
set_param(model, 'LoadInitialState', 'off');
% Mensagem de acompanhamento
disp('Simulando');
% Simulação no tempo definido
sim(model, time(end));
% Salvamento de estado do Simulink para o próximo frame
xInitial = xFinal;

% Sincronização do sinal recebido

% Correção em frequência
foffset_est = lteFrequencyOffset(rmc,rx);
rxFreqCorrected = lteFrequencyCorrect(rmc,rx,foffset_est);

% Sincronização no tempo
offset = lteDLFrameOffset(rmc,rxFreqCorrected,'TestEVM');
rx = rx(1+offset:end,:);

disp('Primeiro frame simulado.');
%% Simulação sucessiva de frames
% Carregamento do estado anterior do Simulink após a simulaçã do primeiro
% frame
% Ativação do carregamento de estado inicial no Simulink
set_param(model, 'LoadInitialState', 'on', 'InitialState','xInitial');
% Atualização do vetor de transmissão com o atraso do filtro
RepeatFrame = [tx(FilterDelaySamples+1:end); tx(1:FilterDelaySamples+1)];
EVMalg.EnablePlotting = 'Off';
cec.PilotAverage = 'TestEVM';

for n = 2:N % Loop para executar os frames restantes
    % Gerando sinal de transmissão
    time = ( (n-1)*FrameLength+(0:FrameLength) + FilterDelaySamples)
    *SamplePeriod;
    txWaveform = timeseries(RepeatFrame,time);

    % Execução do ambiente de simulação
    sim(model, time(end));
    disp('Frame simulado.');
    xInitial = xFinal; % Salvar estado
    
    % Cálculo e resultados da medição de EVM
    evmmeas = hPDSCHEVM(rmc,cec,rx,EVMalg);
    evmpeak(n-1) = evmmeas.Peak;
    evmrms(n-1) = evmmeas.RMS;
end
% Mensagem final
disp('Último frame simulado.');