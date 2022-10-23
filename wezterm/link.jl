link_target_path = "$(@__DIR__)/wezterm.lua"
if Sys.iswindows()
    config_path = "$(ENV["USERPROFILE"])/.config/wezterm/wezterm.lua"
elseif Sys.islinux() || Sys.isapple()
    config_path = "$(ENV["HOME"])/.config/wezterm/wezterm.lua"
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
