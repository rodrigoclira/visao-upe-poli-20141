
clear
features = importdata('C:\Users\Fernando\Dropbox\Mestrado\RECPAD\visao-upe-poli-20141\camastra\camastra_feat.txt')'; 
cod_classes = importdata('C:\Users\Fernando\Dropbox\Mestrado\RECPAD\visao-upe-poli-20141\camastra\camastra_coded_classes.txt')';
classe = importdata('C:\Users\Fernando\Dropbox\Mestrado\RECPAD\visao-upe-poli-20141\camastra\camastra_classes.txt')';

inputs = features;
targets = cod_classes;

net = patternnet(400,'trainscg');
net.performFcn = 'mse';
net = train(net,inputs,targets);
saidas = sim(net, inputs);
[c,matriz] = confusion(targets,saidas);

condicao = size(cod_classes);
for i=1:size(matriz,1)
    for j=1:size(matriz,2)
        if i ~= j
            if matriz(i,j) > condicao
                [exemplos, saidasExemplos] = exemplos(inputs, targets, i, j);
                svmStruct = svmtrain(exemplos, saidasExemplos,'kernel_function', 'rbf');
            end;
        end;
    end;
end;

