%features = importdata('features.txt'); 
%classes = importdata('coded_classes.txt'); 
clear
features = importdata('C:\Users\Fernando\Dropbox\Mestrado\RECPAD\visao-upe-poli-20141\clcs\features.txt')'; 
classes = importdata('C:\Users\Fernando\Dropbox\Mestrado\RECPAD\visao-upe-poli-20141\clcs\coded_classes.txt')';

net = patternnet(400,'trainrp'); 

net.performFcn = 'sse';
net.divideParam.trainRatio = 0.6;
net.divideParam.valRatio = 0.2;
net.divideParam.testRatio = 0.2;

%net.epoches = 10000;

net = train(net, features, classes); 
%saidas = sim(net, features); 
%[c,matriz] = confusion(classes,saidas);