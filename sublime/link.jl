link_target_path = "$(@__DIR__)/User"
if Sys.iswindows()
    config_path = "$(ENV["USERPROFILE"])/scoop/persist/sublime-text/Data/Packages/User"
elseif Sys.islinux()
    config_path = "$(ENV["HOME"])/.config/sublime-text/Packages/User"
elseif Sys.isapple()
    config_path = "$(ENV["HOME"])/Library/Application Support/Sublime Text/Packages/User"
else
    println("OS not yet supported")
    exit()
end

if ispath(config_path)
    print("Config already exists, overwrite? [y/N]: ")
    answer = readline()
    if answer == "y" || answer == "Y"
        rm(config_path, recursive=true)
    else
        exit()
    end
end

symlink(link_target_path, config_path, dir_target=true)
println("Symlink created")
