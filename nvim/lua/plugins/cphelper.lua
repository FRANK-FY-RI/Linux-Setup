return {
	'xeluxee/competitest.nvim',
	dependencies = 'MunifTanjim/nui.nvim',
	config = function()
        require('competitest').setup{
            compile_command = {
                c = { exec = "gcc", args = { "-O2", "$(FNAME)", "-o", "$(FNOEXT)" } },
                cpp = { exec = "g++", args = { "-std=c++23", "-O2", "$(FNAME)", "-o", "$(FNOEXT)" } }, 
            },
        }

        vim.keymap.set('n', '<C-\'>', ':CompetiTest run\r', {})
        vim.keymap.set('n', '<C-;>', ':CompetiTest receive problem\r', {})
    end,
}
