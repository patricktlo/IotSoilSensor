clear all
clc
%load('dadosBloco130');
load('dadosBloco180');

j =0; i=0;
[lnai,lnaj] = size(lna);
[mixeri,mixerj] = size(mixer);
clear mixerj; clear lnaj;

maiorGanho = lnaGanho(1)+mixerGanho(1);
menorGanho = lnaGanho(1)+mixerGanho(1);
posMaiorGanho = [1,1];
posMenorGanho = [1,1];
for i = 1:lnai
    for j = 1:mixeri
        blocoGanho(i,j) = lnaGanho(i)+mixerGanho(j);
        if blocoGanho(i,j) > maiorGanho
            maiorGanho = blocoGanho(i,j);
            posMaiorGanho = [i,j];
        end
        if blocoGanho(i,j) < menorGanho
            menorGanho = blocoGanho(i,j);
            posMenorGanho = [i,j];
        end
    end
end

maiorIip3 = lnaIip3(1)+mixerIip3(1);
menorIip3 = lnaIip3(1)+mixerIip3(1);
posMaiorIip3 = [1,1];
posMenorIip3 = [1,1];
for i = 1:lnai
    for j = 1:mixeri
        blocoIip3(i,j) = lnaIip3(i)+mixerIip3(j);
        if blocoIip3(i,j) > maiorIip3
            maiorIip3 = blocoIip3(i,j);
            posMaiorIip3 = [i,j];
        end
        if blocoIip3(i,j) < menorIip3
            menorIip3 = blocoIip3(i,j);
            posMenorIip3 = [i,j];
        end
    end
end

maiorNf = lnaNf(1)+mixerNf(1);
menorNf = lnaNf(1)+mixerNf(1);
posMaiorNf = [1,1];
posMenorNf = [1,1];
for i = 1:lnai
    for j = 1:mixeri
        blocoNf(i,j) = lnaNf(i)+mixerNf(j);
        if blocoNf(i,j) > maiorNf
            maiorNf = blocoNf(i,j);
            posMaiorNf = [i,j];
        end
        if blocoNf(i,j) < menorNf
            menorNf = blocoNf(i,j);
            posMenorNf = [i,j];
        end
    end
end

maiorPotencia = lnaPotencia(1) + mixerPotencia(1);
menorPotencia = lnaPotencia(1) + mixerPotencia(1);
posMaiorPotencia = [1,1];
posMenorPotencia = [1,1];
for i = 1:lnai
    for j = 1:mixeri
        blocoPotencia(i,j) = lnaPotencia(i)+mixerPotencia(j);
        if blocoPotencia(i,j) > maiorPotencia
            maiorPotencia = blocoPotencia(i,j);
            posMaiorPotencia = [i,j];
        end
        if blocoPotencia(i,j) < menorPotencia
            menorPotencia = blocoPotencia(i,j);
            posMenorPotencia = [i,j];
        end
    end
end

clear i;
clear j;
clear lnai;
clear mixeri;

%save('dadosBlocoAll130');
save('dadosBlocoAll180');

