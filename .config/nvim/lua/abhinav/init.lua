if vim.g.vscode then
    -- VSCode extension
    require("abhinav.remap")
else
    -- ordinary Neovim
    require("abhinav.remap")
    require("abhinav.packer")
    require("abhinav.default")
end

