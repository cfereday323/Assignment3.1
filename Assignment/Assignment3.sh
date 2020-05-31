#Ciaran Fereday
#10393236
#Scripting Languages CSP2101 Assignment 3 Software Based Solution

#!/bin/bash


url="https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/DSC0" #first part of link minus the image number
extension=".jpg"  #last part of link, will be used with $url and produced numbers for downloading


exact()
{
echo " " 
read -p "Enter the Image Number" image #enter image number
exact1="${url}${image}${extension}" #stick together these three variables to create  an image link
wget "$exact1" -P /home/labuser/Desktop/DSCOImages/SpecficNumber/ -q #use the image link produced to download 
echo "Downloading DSCO$image with the file name DSCO$image$extension" #text to show user
echo "Download Complete!"
echo "PROGRAM FINISHED"
}


all1()
{
test=1533
jokes=2042
for ((i=$test; i <= jokes; ++i )) #create loop and for each number between test and joke,assigned to i
do
all2="${url}${i}${extension}" #stick together
echo "Downloading DSCO$i with the file name DSCO$i$extension"
echo "Download complete!"
echo ""
wget "$all2" -P /home/labuser/Desktop/DSCOImages/All/ -q # -P is used to direct to the desired folder
                                                   # -q is used to hide the default output so only ours is shown
done
echo "PROGRAM FINISHED"
}


ranged()
{
read -p "Enter Start Range of file : " start
read -p "Enter End Range of file : " end
echo ""
for ((i=$start; i <= end; ++i ));    #run the following code for each number between start and end
do
   ranged2="${url}${i}${extension}"
   wget "$ranged2" -P /home/labuser/Desktop/DSCOImages/Ranged/ -q
   echo "Downloading DSCO$i With file name DSCO$i$extension"
   echo "Download Complete!"
   echo ""
done
echo "PROGRAM FINISHED"
}


random1()
{
num2=1533
num3=2043

num4=$(($num2-$num3+1));  #there are num4 possible numbers
result1=$RANDOM ;    #generate random number, might not be in the range we want
let "result1 %= $num4";
result1=$(($result1+$num2));   #generate number in the range we would like
rand="${url}${result1}${extension}"
wget "$rand" -P /home/labuser/Desktop/DSCOImages/Random/ -q

echo "Downloading DSCO$result1 with the file name DSCO$result1$extension"
echo "Download complete!"
echo ""
}

random2()
{
read -p "Enter a random number" loop1  #enter number of times the random1 generater should run
for random1 in $(seq 1 "$loop1"); do   #creates a loop to run random1 the inputted times
   random1
   done
echo "PROGRAM FINISHED"
}



  #code to ask user to select which option of download

echo " " 
read -p "Would you like to download All Images? yes(y) or no (n)" answer #if 'y' is typed then execute code
if [ "$answer" == "y" ]; then
   all1           #anything else then continure to next loop
   exit;
fi
   

read -p "Would you like to download a Specific Image Number? Enter yes(y) or no (n)" answer
if [ "$answer" == "y" ]; then
   exact
   exit;
fi

read -p "Would you like to download a Range Of Images? yes(y) or no (n)" answer
if [ "$answer" == "y" ]; then
   ranged
   exit;
fi

read -p "Would you like to download a Random Number Of Images? yes(y) or no (n)" answer
if [ "$answer" == "y" ]; then
   random2
   exit;

else 
   echo "PROGRAM FINISHED"
fi 



 