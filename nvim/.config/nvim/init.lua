vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- options
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- messages in scratch buffer
vim.keymap.set("n", "<leader>m", function()
    vim.cmd("new | put =execute('messages') | setlocal buftype=nofile nobuflisted")
end, { desc = "Messages buffer" })

-- insert today's date
vim.keymap.set("i", "<C-d>", function()
    return os.date("%Y-%m-%d %H:%M")
end, { expr = true })
