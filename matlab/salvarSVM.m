function [ ] = salvarSVM( svmstruct, classe1, classe2)

    name = sprintf('%d_%d.mat',classe1, classe2);
    path = sprintf('C:\\Users\\Fernando\\Dropbox\\Mestrado\\RECPAD\\visao-upe-poli-20141\\matlab\\%s', name);
    save(path , 'svmstruct');

end
