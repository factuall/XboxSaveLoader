# About the tool

XboxSaveLoader is a simple tool that allows devs and testers to quickly switch between saves as well as exporting new ones.  

List of functions from version 1.64.2 (15.04.2024): 
-	Freely exploring the directory with no need for a specific file structure! 
-	Setting the IP of the console and MSA argument (Xbox account e-mail) once and using it for loading any save from the list. 
-	Saving and loading the configuration mentioned above allowing the user to have multiple instances of XboxSaveLoader in different directories (save banks).  
 
> Configuration is saved to the following path: %AppData%\XboxSaveLoader\Config  
 
-	Exporting the current save file to a directory named by the user protected by an additional prompt in case of overwriting an existing save 
  
-	Improved visibility in the save selection screen.  
-	Basic error handling in form of input data validation. 
  
**Known issues:**
-	Having a space character in the name of any directory, email variable or IP variable will cause the tool to crash. 
 
# Get Started - First time setup
1. Download the latest version of the XboxSaveLoader:
 > XboxSaveLoader1.64.2.zip 
 
2. Move the tool to a folder on your Reporting PC that contains your XBOX save files. 
 
> !!! path containing the Save Loader cannot have any spaces and exclamation marks in its name. !!!
3. Make sure that your save directory is following the required format.
 
Save Loader distinguishes Folders that have save file inside them from folders that contain subfolders giving them according tags 
Folder - a Folder with a subfolder inside 
Save - A folder with a Save file inside
Any of them can be selected by just entering their corresponding number in on the keyboard and pressing Enter.
 
> Please remember that the directory names cannot contain any spaces or exclamation marks in their names. 
Also putting a save file into a folder will automatically make it appear as a Save category folder ignoring any subfolders stored inside it.  
 
4. Boot the save loader  
> XboxSaveLoader.bat Windows Command Prompt will appear  

**Quick walkthrough through the main menu**
Currently in the 1.40 version of the save loader the main menu consists of 6 pre-build options with their corresponding letters A,B,C,D,E,S,Z. The options you will see under them are the Save directories that the Loader detects and they will be numbered. 
 
- Option A will ask you to put YOUR console IP. 
- Option B will ask you to put YOUR email that you are currently logged in with The part of the email that you need to put in should contain everything before @xboxtest.com 
- Option S will ask you to put the TITLE'S SCID. 
- Option C will save your values in A and B options to Appdata -> Roaming -> XboxSaveLoader -> Config. 
- Option D will load the Values from config file located in Appdata -> Roaming -> XboxSaveLoader -> Config.  Note: It is important to save your config after putting your IP and Email in since the Save loader won't remember them after closing. 
- Option E will ask you to name the save file and save what’s currently loaded on your console. After saving it will get exported into X_____EXPORTED_SAVES (if this folder does not exist it will create after using this command) 
- Option Z will display information about its current version and credits. 
 
Selecting Options from 1-X will go through the save directories you created before and load the saves inside them onto your console. 
 
To select any of the options just put their corresponding letter / number in the Enter your choice field: 
 
5. Setting Up the XBOX Save Loader
 
Start by putting in your Console IP.   
To do that just to put letter A into Enter your choice: field then follow it by pressing enter. 
  
Now the save loader will ask you to put your Console IP in.  
  
The IP should consist of numbers divided by dots for example "192.168.1.1". 
  
The second step of the preparation is to set up your account. 
> Note: The account must be the same one as the one you're are currently logged in with on your console.  
To set your account put letter B into Enter your choice: and press enter. The Save Loader will ask you to put your XBOX account email now. 
  
The information needed to be provided in this box is everything before @xboxtest.com 
For Example, if the mail is XBACC-TEST123456@xboxtest.com. 
Just take XBACC-TEST123456 and put it in. 
Note: If you copy the needed part of your XB account email you can paste it by just clicking  
the Right Mouse Button on the Save Loader Window. 
 
The second step of the preparation is to set up your title's SCID. 
To set your account put letter S into Enter your choice: and press enter. The Save Loader will ask you to put your SCID. 
 
If everything is Set-up correctly the first two option's rows will look similarly to this. 
  
Make sure the IP of the console and XBOX account email match with your Console. 
 
6. Saving and Importing the Save Loader config
 
Now you can put the letter C in Enter your choice: to save your config for later. 
> It is important to save your config for later since the Save Loader will not remember your credentials if you run it again without it. 
 
Selected IP, XBOX account and SCID will now save in a Config file in Appdata -> Roaming -> XboxSaveLoader -> Config  
  
So anytime you run XBOX save loader you can just put the letter D in the Enter your choice: to load the config you saved earlier. 
  
# Save Importing - How to
The Save Loader will show you all of the folders it detects in its directory. 
  
Save Loader distinguishes Folders that have save file inside them from folders that contain subfolders giving them according tags 
- Folder - a Folder with a subfolder Inside 
- Save - A folder with a Save file inside 
 
Any of them can be selected by just entering their corresponding number in on the keyboard and pressing Enter. 
> Please remember that the directory names cannot contain any spaces or exclamation marks in their names. 
Also putting a save file into a folder will automaticly make it appear as a Save category folder ignoring any subfolders stored inside it.  
 
If you have selected an category tagged as a Folder 
The Save Loader will now display all the subfolders/saves that are contained inside of the selected category. 
  
From there you can select the number corresponding to the chosen save or go back to the Main Menu by selecting option 0. 
Selecting a category tagged as Save will import the selected file onto your XBOX console 
  
Now after loading the XB Save Loader should display green DONE message meaning that the save is loaded onto the console and you are ready to boot the title. 
Pressing any key in this state will return you to the Main Menu. 
 
> Any errors messages that may appear in during the save loading process would be displayed right above DONE message. The message itself will be displayed regardless of the success of the process.  
# Save Exporting - How to

XboxSaveLoader main menu will display available option to export your chosen save. 
To Export save that is currently loaded on your console type E in the Main Menu. 
After pressing enter you will be asked to name the save file.  
> The name cannot contain any spaces. 
After choosing the name of your save and pressing enter the save will start to export. If folder named X_____EXPORTED_SAVES did not exist before the Save Loader will create it and export your save into the subfolder with the name you put in beforehand. If you try to export another save under the same name as one exported before the Save Loader will ask if you wish to overwrite the already existing save. To proceed with export and overwrite the file type Y in the Enter your choice: box and to cancel type N and press Enter.
