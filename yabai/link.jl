link_target_path = "$(@__DIR__)/yabairc"
if Sys.isapple()
    config_dir = "$(ENV["HOME"])/.config/yabai"
    config_path = "$config_dir/yabairc"
else
    println("yabai is only for MacOS")
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
