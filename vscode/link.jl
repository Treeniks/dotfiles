link_target_path = "$(@__DIR__)/settings.json"
if Sys.iswindows()
    config_dir = "$(ENV["USERPROFILE"])/scoop/persist/vscode/data/user-data/User"
elseif Sys.isapple()
    config_dir = "$(ENV["HOME"])/Library/Application Support/Code/User"
elseif Sys.islinux()
    config_dir = "$(ENV["HOME"])/.config/Code/User"
else
    println("OS not yet supported")
    exit()
end
config_path = "$config_dir/settings.json"

if isfile(config_path)
    print("Config already exists, overwrite? [y/N]: ")
    answer = readline()
    if answer == "y" || answer == "Y"
        rm(config_path)
    else
        exit()
    end
end

mkpath(config_dir)
symlink(link_target_path, config_path)
println("Symlink created")
