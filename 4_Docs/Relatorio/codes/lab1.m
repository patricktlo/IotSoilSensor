clear; clc; close all;

matriz = cell (1,9); %% Cria Matriz com todas as imagens

matriz(1) = {'airplane512.tif'};
matriz(2) = {'baboon256.tif'};
matriz(3) = {'bridge256.tif'};
matriz(4) = {'cameraman256.tif'};
matriz(5) = {'lenna512.tif'};
matriz(6) = {'peppers512.tif'};
matriz(7) = {'sailboat512.tif'};
matriz(8) = {'shuttle_80x60.tif'};
matriz(9) = {'tiffany512.tif'};

%%Definindo níveis iniciais para calculo da entropia
entropy = 0; 
maiorEntropia = -1;
menorEntropia = 1000;
maiorCompressao = 0;

%Faz para todas as imagens
for j = 1 : length(matriz)
entropy = 0;    
    
im_in=imread(matriz{j});        % Matriz Tipo uint8
im_in=double(im_in);            % Matriz Tipo double

L=8;
[size_r,size_c]=size(im_in);    % Tamanho da Matriz     
im_size=size_r*size_c;          % Tamanho Total do Vetor
im_vec=reshape(im_in,1,im_size);% Transforma em Vetor Linha

figure;
x = 0:255;
hist(im_vec,x)

% Calculo das Probabilidades
n= histc(im_vec,x);            % Número de Ocorrencias para Cada Valor
p=n./(im_size);                % Calcula as Probabilidades de Ocorrencia


for i = 1 : length(p)
    if (p(i) ~= 0 )   %Valores com probabilidade diferente de zero
        entropy = entropy + p(i)*log2(1/p(i)); % Calcula a Entropia
    end
end

%Imagens com maiores variacoes de niveis de cinza possuem maior entropia
if (entropy < menorEntropia)
    menorEntropia = entropy;
    figuraMenorEntropia = matriz{j};
end
if (entropy > maiorEntropia)
    maiorEntropia = entropy;
    figuraMaiorEntropia = matriz{j};
end

%Huffmandict
dict = huffmandict(x,p);

%Huffmanenco
enco = huffmanenco(im_vec,dict);

%Tamanho original da imagem:
imagem_original = im_size * 8;

%Entropia da figura comprimida:
entropy_new = length(enco) / im_size;

eficiencia = entropy / entropy_new;
disp(['A figura ' matriz{j} ' possui eficiencia de ' num2str(eficiencia)])


if (eficiencia > maiorCompressao)
    figuraMaisComprimida = matriz{j};
    tamanhoMaisComprimida = length(enco);
    maiorCompressao = tamanhoMaisComprimida/imagem_original;    
end

figure;
colormap(gray);
h=image(im_in);
set(h,'CDataMapping','scaled')
axis('equal');

end

maiorCompressao = (1 - maiorCompressao) * 100;
disp(['-----------------------------------------------------------------'])
disp(['-----------------------------------------------------------------'])
disp(['A figura que apresenta maior entropia eh: ' figuraMaiorEntropia])
disp(['Com entropia = ' num2str(maiorEntropia)])

disp(['A figura que apresenta menor entropia eh: ' figuraMenorEntropia])
disp(['Com entropia = ' num2str(menorEntropia)])

disp(['Imagens com maiores variacoes de niveis de cinza, possuem maior'])
disp(['entropia'])
disp(['-----------------------------------------------------------------'])
disp(['-----------------------------------------------------------------'])
disp(['A figura mais comprimida eh: ' figuraMaisComprimida])
disp(['Com tamanho = ' num2str(tamanhoMaisComprimida) ' , sendo '])
disp([num2str(maiorCompressao) ' % menor que a original '])
