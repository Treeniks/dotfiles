# dotfiles

These are my setup files for some of the programs I use daily.

I use [Julia](https://julialang.org/) scripts to automatically create symlinks to the correct locations from within this repository. The point in using Julia is that it's a nice language and allows for one script to support multiple platforms. With that said, the scripts are supposed to support both Windows and Linux (I don't own a Mac), although since my primary platform is Windows, I often have not added the config paths for Linux.

Sometimes elevated privileges are required for the scripts to work correctly.

If using Windows, it is recommended to have this repository located on the C: Drive, because some programs will have problems with the symlinks if it is located on a different Drive.

For Windows installations, it is also usually assumed that the program in question is installed via [scoop](https://scoop.sh/). If it isn't, the config paths will be usually be incorrect.
