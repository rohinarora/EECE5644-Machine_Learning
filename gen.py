import sys
import os
lecture_number= (sys.argv[1])
num_images= len(os.listdir(lecture_number+'/yourscanfromsnelllibrary'))
images=os.listdir(lecture_number+'/yourscanfromsnelllibrary')
if (num_images==0):
    print ('fucked up. num_images==0. try again')
    sys.exit()
for i in sorted(images):
    print ('![](yourscanfromsnelllibrary/'+str(i)+')')
