require 'nvim-treesitter.configs'.setup{
    -- add different language
    ensure_installed = { 
        "vim",
        "bash",
        "c",
        "cpp",
        "java",
        "json",
        "lua",
        "python",
    },

    highlight = {
        enable = true,
        disable = {"latex"},
    },
    indent = { enable = true },

    -- different bracket in different color --
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}
