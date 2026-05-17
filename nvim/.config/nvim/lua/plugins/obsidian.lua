return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        workspaces = {
            {
                name = "vault",
                path = "/Volumes/mediahdd/AppData/obsidian/config/Obsidian Vault",
            },
        },
        daily_notes = {
            folder = "Daily",
        },
        completion = {
            nvim_cmp = false,
        },
        mappings = {
            ["gf"] = {
                action = function() return require("obsidian").util.gf_passthrough() end,
                opts = { noremap = false, expr = true, buffer = true },
            },
        },
        -- use note title as filename
        note_id_func = function(title)
            if title ~= nil then
                return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                return tostring(os.time())
            end
        end,
        ui = { enable = true },
    },
    keys = {
        { "<leader>on", "<cmd>ObsidianNew<cr>",          desc = "New note" },
        { "<leader>oo", "<cmd>ObsidianOpen<cr>",         desc = "Open in Obsidian app" },
        { "<leader>of", "<cmd>ObsidianQuickSwitch<cr>",  desc = "Find note" },
        { "<leader>og", "<cmd>ObsidianSearch<cr>",       desc = "Grep notes" },
        { "<leader>ob", "<cmd>ObsidianBacklinks<cr>",    desc = "Backlinks" },
        { "<leader>ot", "<cmd>ObsidianToday<cr>",        desc = "Today's daily note" },
        { "<leader>ol", "<cmd>ObsidianLinks<cr>",        desc = "Links in note" },
        { "<leader>oT", "<cmd>ObsidianTags<cr>",         desc = "Browse tags" },
    },
}
