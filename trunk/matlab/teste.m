clear

%load iris_dataset;

%inputs = irisInputs;
%targets = irisTargets;

features = importdata('C:\Users\Fernando\Dropbox\Mestrado\RECPAD\visao-upe-poli-20141\camastra\camastra_feat.txt')'; 
cod_classes = importdata('C:\Users\Fernando\Dropbox\Mestrado\RECPAD\visao-upe-poli-20141\camastra\camastra_coded_classes.txt')';
classe = importdata('C:\Users\Fernando\Dropbox\Mestrado\RECPAD\visao-upe-poli-20141\camastra\camastra_classes.txt')';

inputs = features;
targets = cod_classes;


acertos = 0;
total = 0;

%Configuracao da rede
net = patternnet(100,'trainscg');
net.performFcn = 'mse';
net.divideParam.trainRatio = 0.5;
net.divideParam.valRatio = 0.25; 
net.divideParam.testRatio = 0.25;
%

%Treinamento da rede
[net, tr] = train(net,inputs,targets);
%

%Criar matriz de confusao
tInd = tr.trainInd;
trainInputs = inputs(:,tInd);
trainTargets = targets(:,tInd);
trainOutputs = sim(net, trainInputs);
%


% Matriz de confusao do teste
[c, matriz] = confusion(trainTargets, trainOutputs);  
%

% Cria a SVM para cada classe que tenha duvida
condicao = 0.1 * size(trainTargets);
criarSVM(matriz, trainInputs, trainTargets, condicao);
%

testInd = tr.testInd;
testsInputs = inputs(:,testInd);
testsTargets =  targets(:,testInd);

% COLOCAR UM FOR PRA CADA INPUT E TESTAR SE TEM UMA SVM
for  i=1:length(testsInputs)
   
   input = testsInputs(:,i); 
   target = testsTargets(:,i);
   calculatedOutput = sim(net, input);
   
   %Vencedor leva tudo 
   calculatedOutput  = calculatedOutput(:,1) >= max(calculatedOutput(:,1));
   
   classe = decodeClasse(calculatedOutput);
   targetDecoded = decodeClasse(target);
   
   % SVM 
   pattern = sprintf('C:\\Users\\Fernando\\Dropbox\\Mestrado\\RECPAD\\visao-upe-poli-20141\\matlab\\%d_*', classe);
   svms = dir(pattern);   
   
   if size(svms) ~= 0       
       svm = lerSVM(svms(1).name);
       input_invertido = input';
       calculatedOutputSvm = svmclassify(svm, input_invertido);
       
       splitted = strsplit(svms.name,'.');
       splitted = splitted{:};
       splitted = strsplit(splitted,'_');
       classe2 = splitted{2};
       
       if calculatedOutputSvm == 1
          classe = classe2; 
       end
   end
       
   if targetDecoded == classe
      acertos = acertos + 1;
   end
   
   total = total + 1;
end

'Total de acertos'
acertos/total
%tstPerform = sim(net,targets(:,tInd),tstOutputs);

%[c,matriz] = confusion(targets(:,tInd),tstPerform);


%saidas = sim(net, inputs);

%[c,matriz] = confusion(targets(:,tInd),tstOutputs);
%

%criarSVM(matriz, inputs, targets, condicao);

