# GitHub and Version Control for Music Production
During my time as a Computer Science student, I was also part of the university's choir for all 4 years. Music making in choir was a joy, and it introduced me to so many creative individuals, a lot whom were sound engineers and audio producers. They inspired me to start music production during quarantine.
>
I wanted to make a guide on how to use GitHub to collaborate efficiently and securely on music. 

## GitHub?
GitHub is the world's largest hosting platform for software repositories. Instead of code, the music we make will be stored on here. This will allow you and your collaborators to easly access your songs.

## Digital Audio Workstation?
The debate is always raging over which DAW is the best. There is no real answer because it all depends. In my case, Ableton is my preference. From what I understand, most DAW's use custom binaries for their file type so if you use a different DAW, this process will be almost the same.

### Step 1 Create Account
First go to github.com and setup an account. You should also check create an organization, so every project you make is under one organization and is easier to access by more people. Under one organization there can even be multiple teams so projects can be hidden from other organization members. 

### Step 2: Install Git
If you are on a Mac/Linux git is already installed. If you are on windows, you have to go to git-scm.com to install the latest version of git on your computer. Make sure you go through the whole setup before continuing. 

### Step 3: The Command Line
We will be using the commandline to manage our versions. We need a basic understanding on how to navigate our filesystem. For now, we use 'ls' to list our files and directories and 'cd FOLDERNAME' to enter a folder. There are a couple other commands that will be used but I will mention them later

## Lets make a song!
The hardest part of this process is making a song. Just start a project and add some basic elements to it and save it as a folder. Make sure you save everything so that all the audio files used in the project all accessible in this folder. Then go to your commandline and enter the folder your project exists in. While in that folder, enter 'git init' to initialize version control in that project. 
>
Now go to github and create a new repository under your organization. Go through the process of naming it and making it public/private. Then you will be met with a page that asks how you want to set up the repository. Since we already made the music project let's take the line that says
>  git remote add origin https://github.com/Organization-Name/SONGNAME.git

and add it to the the same commandline where we initialized version control. This will be connecting the our project to github so we can make changes and manage different versions. The repository is initialized, we have to add all the files for our first push. Now we have to write a string of commands into the commandline. First let's add all the files with "git add ." (the . means all files but you can add them individually by typing a filename). Then let's commit those changes with "git commit -am 'This message should describe your changes'". Finally we can write "git push -u origin master". 
>
Now all the files are in github. You do not have to worry about corrupted files or losing saves because everything is stored in github. 

### Branches
In git, branches refer to an independant line of development. Let's say you are collaborating on a song. Your friend thinks the song should sound jazzy while you think it should sound more like soul. You each can branch off and develop the songs in a different branch. 
>
Using the command "git branch -b NAMEOFBRANCH" we can easily create a new branch based off master and switch to it (using the -b). 

### Pulling
Before making changes to your branch make sure you pull changes from github using the command "git pull". Since all DAW's make binary files, the commits you make will most likely have differences  that will be overritten. 

## Other methods
While this is a free way to use version control in audio engineering, do more research into git and other methods of music collaboration. Look into using a git GUI. Use professional grade tools like Splice or BlendIO.
