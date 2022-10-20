link_target_path = "$(@__DIR__)/alacritty.yml"
if Sys.iswindows()
    config_path = "$(ENV["APPDATA"])/alacritty/alacritty.yml"
elseif Sys.isapple()
    config_path = "$(ENV["HOME"])/.config/alacritty/alacritty.yml"
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
