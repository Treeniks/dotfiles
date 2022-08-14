link_target_path = "$(@__DIR__)/rustfmt.toml"
if Sys.iswindows()
    config_path = "$(ENV["APPDATA"])/rustfmt/rustfmt.toml"
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
