from CA import doConvexityApproach
from glob import glob
from os import sep
from os import path

LEN = 10
FOLDER = 'test_border'


if __name__ == '__main__':
    files = glob('..' + sep + FOLDER + sep + "*.png")
#    print files
    files.reverse()
    feat = open('clcs_features.txt','w')
    classes = open('clcs_classes.txt','w')
    
    lines_feat = []
    lines_classes = []

    for image in files:
#        print image
        try:
            points = doConvexityApproach(image, LEN)
        
            filename, fileextension  = path.splitext(image)
            classe = filename.split('/')[-1].split('_')[0]
            #charfile = open(filename + '.chr','w')
            points = "".join(map(lambda x: '%f ' % x, points)).strip()
            lines_feat.append(points + '\n')
            lines_classes.append('%s\n' % classe)

        except AttributeError:
            print 'error'
      
    feat.writelines(lines_feat)
    classes.writelines(lines_classes)
