function [] = criarSVM(matriz, inputs, targets, condicao)
    
    for i=1:size(matriz,1)
        for j=1:size(matriz,2)
            if i ~= j
                if matriz(i,j) > condicao
                    sprintf('Criando SVM para o par (%d, %d)', i , j)
                    [exemplos, saidasExemplos] = exemplos_svm(inputs, targets, i, j);
                    svmStruct = svmtrain(exemplos, saidasExemplos,'kernel_function', 'rbf');
                    salvarSVM(svmStruct, i, j);  
                end;
            end;
        end;
    end;
    
end

