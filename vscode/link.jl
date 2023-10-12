link_target_path = "$(@__DIR__)/settings.json"
if Sys.iswindows()
    config_dir = "$(ENV["USERPROFILE"])/scoop/persist/vscode/data/user-data/User"
    config_path = "$config_dir/settings.json"
elseif Sys.isapple()
    config_dir = "$(ENV["HOME"])/Library/Application Support/Code/User"
    config_path = "$config_dir/settings.json"
else
    println("OS not yet supported")
    exit()
end

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
