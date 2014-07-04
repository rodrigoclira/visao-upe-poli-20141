function [ svmstruct ] = lerSVM(name)
    
    name = sprintf('%s', name);
    path = sprintf('C:\\Users\\Fernando\\Dropbox\\Mestrado\\RECPAD\\visao-upe-poli-20141\\matlab\\%s', name);
    load(path, 'svmstruct');   
end
