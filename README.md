# dotfiles

These are my setup files for some of the programs I use daily.

I use [Julia](https://julialang.org/) scripts to automatically create symlinks to the correct locations from within this repository. The scripts are supposed to support Windows, Linux and Mac, although since my primary platform is Windows, I often have not added the config paths for Linux/Mac.

Sometimes elevated privileges are required for the scripts to work correctly.

If using Windows, it is recommended to have this repository located on the C: Drive, because some programs will have problems with the symlinks if it is located on a different Drive.

For Windows installations, it is also usually assumed that the program in question is installed via [scoop](https://scoop.sh/). If it isn't, the config paths will usually be incorrect.
