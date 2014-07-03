import cv2
from CA import binaryImage
import numpy as np
import Image
import ImageOps
from glob import glob

def modify_image(path):

    img = cv2.imread(path); # transformar em array numpy
    thresh = binaryImage(img) # binarizar
#    cv2.imwrite("aaa.png", thresh) 
    #img2 = createWhiteImage(img)

    
    kernel = np.ones((1,1),'uint8') # kernel dilatacao
    thresh1 = cv2.dilate(thresh, kernel) #dilatacao


    kernel = np.ones((1,1),'uint8') # kernel da erosao

    thresh = cv2.erode(thresh, kernel) # erosao
    cv2.imwrite('depois'+path, thresh1)

def add_border(path, newpath):
#    print newpath
    image_file = Image.open(path)
    new_image_file = ImageOps.expand(image_file, border=2, fill='black')
    new_image_file.save(newpath)

if __name__ == '__main__':
    files = glob('test/*.png')

    for image in files:
#        print files
        filename = image.split('/')[1]
        add_border(image, 'test_border_bmp/' +  filename.split('.')[0]+ '.bmp')

