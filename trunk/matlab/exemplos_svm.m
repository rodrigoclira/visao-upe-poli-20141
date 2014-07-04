function [ exemplos, classes ] = exemplos_svm( entradas, saidas, a , b)

exemplos = [];
classes = [];

for j=1:size(entradas,2)
    entradas(a,j);
    if saidas(a,j) == 1
        exemplos = horzcat(exemplos, entradas(:,j));
        classes = horzcat(classes, 0);        
    end;
    if saidas(b,j) == 1
        exemplos = horzcat(exemplos, entradas(:,j));
        classes = horzcat(classes, 1);
    end;
end


exemplos=exemplos';
