return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", function()
            builtin.find_files({
                find_command = { "fd", "--type", "f", "--exclude", "node_modules", "--exclude", ".git" }
            })
        end, { desc = "Find files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
        -- grep with include/exclude prompts
        vim.keymap.set("n", "<leader>fG", function()
            vim.ui.input({ prompt = "Glob (e.g. *.ts): " }, function(glob)
                vim.ui.input({ prompt = "Exclude glob (e.g. **/dist/**): " }, function(exclude)
                    local args = { "--hidden" }
                    if glob and glob ~= "" then
                        vim.list_extend(args, { "-g", glob })
                    end
                    if exclude and exclude ~= "" then
                        vim.list_extend(args, { "-g", "!" .. exclude })
                    end
                    builtin.live_grep({ additional_args = args })
                end)
            end)
        end, { desc = "Live grep with filters" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
    end,
}
