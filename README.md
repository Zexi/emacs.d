# Emacs config for learning #
This is my emacs configuration for learning emacs and manage config files version.

# How to install it: #
  Backup yours emacs configure files like `~/.emacs, ~/.emacs.d.`  
  Then use:
```
git clone  https://github.com/Zexi/emacs.d.git ~/.emacs.d
```
# Code structure: #
  File in '.emacs.d/init.el' bootstraps the configuration.   
  Other config files are placed in 'lisp/init-*.el', and required packages will be downloaded at first boot.
