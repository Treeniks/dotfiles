link_target_path = "$(@__DIR__)/nvim"
if Sys.iswindows()
    config_path = "$(ENV["LOCALAPPDATA"])/nvim"
elseif Sys.isapple() || Sys.islinux()
    config_path = "$(ENV["HOME"])/.config/nvim"
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
