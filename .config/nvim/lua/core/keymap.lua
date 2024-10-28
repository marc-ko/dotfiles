vim.g.mapleader = " "

local keymap = vim.keymap

--------- insert mode ---------
keymap.set("i", "jk", "<ESC>")

--------- visual mode ---------

-- line moving -- 
keymap.set("v", "J", ":m '>+1<CR>gv=gv") 
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--------- normal mode ---------
-- window --
keymap.set("n", "<leader>sv", "<C-w>v") -- horizontal
keymap.set("n", "<leader>sh", "<C-w>s") -- vertical

--------- cancel highlight ----------
keymap.set("n", "<leader>nh", ":nohl<CR>")

----------- plugins -----------
-- nvim-tree --
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- latex related --
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev) -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc" -- Buffer local mappings

    local opts = { buffer = ev.buf }

    keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- go to definition
    keymap.set("n", "K", vim.lsp.buf.hover, opts)       
    -- show the info, click twice to jump to corresponding window

    keymap.set("n", "gR", vim.lsp.buf.rename, opts)     
    -- Rename item among all files in the current working document

    keymap.set("n", "gr", vim.lsp.buf.references, opts)
    -- show each place where reference appears
    end,
})
