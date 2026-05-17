return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    config = function()
        require("nvim-treesitter.install").install({
            "lua", "typescript", "javascript", "tsx",
            "go", "bash", "json", "yaml", "css", "html",
        })

        -- enable treesitter highlight per filetype
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
