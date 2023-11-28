link_target_path = "$(@__DIR__)/starship.toml"
if Sys.isapple() || Sys.islinux()
    config_dir = "$(ENV["HOME"])/.config"
    config_path = "$config_dir/starship.toml"
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
