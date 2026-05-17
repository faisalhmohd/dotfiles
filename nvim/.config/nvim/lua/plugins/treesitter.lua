return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            "lua", "typescript", "javascript", "tsx",
            "go", "bash", "json", "yaml", "css", "html",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
