features = importdata('camastra_feat.txt')';
classes = importdata('camastra_coded_classes.txt')';
net = patternnet(400,'trainscg','mse');
net = train(net,features,classes);
saidas = sim(net, features);
[c,matriz] = confusion(classes,saidas);
