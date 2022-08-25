link_target_path = "$(@__DIR__)/settings.json"
if Sys.iswindows()
    config_path = "$(ENV["USERPROFILE"])/scoop/persist/vscode/data/user-data/User/settings.json"
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

symlink(link_target_path, config_path)
println("Symlink created")
