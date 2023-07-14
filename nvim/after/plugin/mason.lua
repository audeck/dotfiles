require("mason").setup({
    ui = {
        keymaps = {
            install_package = "<CR>",
            cancel_installation = "<C-c>",
            uninstall_package = "d",

            update_package = "u",
            update_all_packages = "U",

            toggle_package_expand = "l",
            check_package_version = "v",
            check_outdated_packages = "V"
        }
    }
})

