from CA import doConvexityApproach
from glob import glob
from os import sep
from os import path

LEN = 25
FOLDER = 'test'


if __name__ == '__main__':
    files = glob(FOLDER + sep + "*.png")
#    print files
    files.reverse()
    feat = open('features.txt','w')
    classes = open('classes.txt','w')
    
    lines_feat = []
    lines_classes = []

    for image in files:
#        print image
        try:
            points = doConvexityApproach(image, LEN)
        
            filename, fileextension  = path.splitext(image)
            classe = filename.split('_')[0].split('/')[1]
            #charfile = open(filename + '.chr','w')
            points = "".join(map(lambda x: '%f ' % x, points)).strip()
            lines_feat.append(points + '\n')
            lines_classes.append('%s\n' % classe)

        except AttributeError:
            print 'error'
      
    feat.writelines(lines_feat)
    classes.writelines(lines_classes)
