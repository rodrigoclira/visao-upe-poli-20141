
from string import lowercase
from string import uppercase

classes = list(lowercase + uppercase)

print classes

classes_file = open('clcs/classes.txt')
coded_classes_file = open('clcs/coded_classes.txt','w')

list_codeds = []
for line in classes_file:
    coded = list(52 * '0')
    classe = line.replace('\n','').replace('\r','')
    pos = classes.index(classe)
    coded[pos] = '1'
    coded = ' '.join(coded)
    list_codeds.append(coded + '\n')
    #coded = ' '.join("%052d" % int(bin(pos)[2:]))
    #print classe, coded
    ##raw_input()

coded_classes_file.writelines(list_codeds)

coded_classes_file.close()

