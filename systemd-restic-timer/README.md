# Requirments:
You must have a SSH without a passkey setup between you machine and your remote server.


# How to run the script
Make sure to change all the varible paths so it matches your system.

Start by running the init.sh script, the script will create all the necessary files that you need. 

init your restic repo with this command and set up a password to the repo.
``` 
restic -r sftp:<SERVER>:<SERVER_PATH> init
```

Add the password to your passwd-restic file and then you are done!


