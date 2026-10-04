return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {'nvim-lua/plenary.nvim'},

    config = function()
        local telescope = require("telescope")
        local telescope_builtin = require("telescope.builtin")

        vim.keymap.set('n', '<C-e>', telescope_builtin.find_files, {})
        vim.keymap.set('n', '<leader>lg', telescope_builtin.live_grep, {})

        telescope.setup({
            defaults = {
                mappings = {
                    n = {
                        ["<C-i>"] = function(prompt_bufnr)
                            local action_state = require("telescope.actions.state")
                            local actions = require("telescope.actions")

                            local selection = action_state.get_selected_entry()

                            if not selection or not selection.path then
                                return
                            end

                            local path = selection.path

                            actions.close(prompt_bufnr)

                            local lines = vim.fn.readfile(path)

                            vim.api.nvim_put(lines, "l", true, true)
                        end,
                    },
                },
            },
        })
    end
}
