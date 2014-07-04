function [classe] = decodeClasse(calculatedOutput)

    for j=1:size(calculatedOutput)
           if calculatedOutput(j) == 1
               classe=j;
               break;
           end
    end
   
end