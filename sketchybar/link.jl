link_target_path = "$(@__DIR__)/sketchybar"
if Sys.isapple()
    config_path = "$(ENV["HOME"])/.config/sketchybar"
else
    println("sketchybar is only for MacOS")
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
