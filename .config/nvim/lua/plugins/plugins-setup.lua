local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
       'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons'-- file tree
  } 
  use ("nvim-lua/plenary.nvim")
  use ("christoomey/vim-tmux-navigator")    -- use ctrl-hjkl to window-switch
  use "nvim-treesitter/nvim-treesitter"     -- syntax highlight
  use "p00f/nvim-ts-rainbow"
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig"
  }
  
    -- auto fill
  use ("hrsh7th/nvim-cmp")
  use ("hrsh7th/cmp-nvim-lsp")
  use ("L3MON4D3/LuaSnip")      -- snippets engine
  use ("saadparwaiz1/cmp_luasnip")
  use ("rafamadriz/friendly-snippets")
  use ("hrsh7th/cmp-path")      -- file path

  use "numToStr/Comment.nvim"   -- gcc and gc Comment
  use "windwp/nvim-autopairs"   -- autofill bracket
  
  use "lervag/vimtex"           -- latex  
  use "jordansissel/xdotool"
  
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
