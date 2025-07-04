local o = vim.o

--  NOTE: Mapleader must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.keymap.set({ 'i', 'n', 'v' }, '<leader><leader>', '<Esc>', {
  desc = 'Escape',
})

-- Buffer navigation
vim.keymap.set('n', '<tab>', '<cmd>b#<cr>', {
  desc = 'Switch to last buffer',
})
vim.keymap.set('n', '<s-tab>', '<cmd>b#<cr><cmd>bd #<cr>', {
  desc = 'Switch to last buffer and close current',
})

-- Don't remove leading space in a line.
vim.keymap.set('i', '<CR>', '<CR>x<BS>', { silent = true })
vim.keymap.set('n', 'o', 'ox<BS>', { silent = true })
vim.keymap.set('n', 'O', 'Ox<BS>', { silent = true })

-- Copy the current file path to the clipboard
vim.keymap.set(
  'n',
  '<leader>h',
  "<cmd>let @*=expand('%')<CR><cmd>echo 'Copied: '@*<CR>",
  { silent = true, desc = 'Copy relative file pat[H]' }
)
vim.keymap.set(
  'n',
  '<leader>H',
  "<cmd>let @*=expand('%:p')<CR><cmd>echo 'Copied: '@*<CR>",
  { silent = true, desc = 'Copy absolute file pat[H]' }
)

-- Delete last word with option-backspace.
vim.keymap.set('i', '<M-BS>', '<Esc><Space>cb', { silent = true })

-- folding
o.foldmethod = 'expr' -- Set fold method to "expr"
o.foldenable = true -- Enable folding by default
o.foldlevel = 99 -- Open all folds by default
o.foldexpr = 'nvim_treesitter#foldexpr()'

-- tabs
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

-- See :h fo-table
o.formatoptions = 'jcroqln'
vim.bo.textwidth = 80

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
-- vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 2

vim.diagnostic.config {
  virtual_lines = true,
}
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', {
  desc = 'Clear search highlights',
})

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {
  desc = 'Open diagnostic [Q]uickfix list',
})

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', {
  desc = 'Exit terminal mode',
})

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w>h', {
  desc = 'Move focus to the left window',
})
vim.keymap.set('n', '<C-l>', '<C-w>l', {
  desc = 'Move focus to the right window',
})
vim.keymap.set('n', '<C-j>', '<C-w>j', {
  desc = 'Move focus to the lower window',
})
vim.keymap.set('n', '<C-k>', '<C-w>k', {
  desc = 'Move focus to the upper window',
})
vim.keymap.set('i', '<C-h>', '<C-\\><C-n><C-w>h', {
  desc = 'Move focus to the left window',
})
vim.keymap.set('i', '<C-l>', '<C-\\><C-n><C-w>l', {
  desc = 'Move focus to the right window',
})
vim.keymap.set('i', '<C-j>', '<C-\\><C-n><C-w>j', {
  desc = 'Move focus to the lower window',
})
vim.keymap.set('i', '<C-k>', '<C-\\><C-n><C-w>k', {
  desc = 'Move focus to the upper window',
})
-- Resize splits.
vim.keymap.set('n', '+', '<C-w>+', { desc = 'Increase window height' })
vim.keymap.set('n', '_', '<C-w>-', { desc = 'Decrease window height' })
vim.keymap.set('n', '-', '<C-w><', { desc = 'Decrease window width' })
vim.keymap.set('n', '=', '<C-w>>', { desc = 'Increase window width' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup(
    'kickstart-highlight-yank',
    { clear = true }
  ),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup {
  spec = {
    -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

    {
      'AndrewRadev/sideways.vim',
      config = function()
        vim.keymap.set('n', '<M-,>', '<cmd>SidewaysLeft<cr>', {
          desc = 'Move list item left',
        })
        vim.keymap.set('n', '<M-.>', '<cmd>SidewaysRight<cr>', {
          desc = 'Move list item right',
        })
        vim.keymap.set('n', '≤', '<cmd>SidewaysLeft<cr>', {
          desc = 'Move list item left',
        })
        vim.keymap.set('n', '≥', '<cmd>SidewaysRight<cr>', {
          desc = 'Move list item right',
        })
      end,
    },
    'AndrewRadev/tagalong.vim',
    {
      'andythigpen/nvim-coverage',
      event = 'VeryLazy',
      config = function()
        require('coverage').setup {
          commands = true, -- create commands
          highlights = {
            -- customize highlight groups created by the plugin
            covered = { fg = '#C3E88D' }, -- supports style, fg, bg, sp (see :h highlight-gui)
            uncovered = { fg = '#F07178' },
          },
          signs = {
            -- use your own highlight groups or text markers
            covered = { hl = 'CoverageCovered', text = '▎' },
            uncovered = { hl = 'CoverageUncovered', text = '▎' },
          },
          summary = {
            -- customize the summary pop-up
            min_coverage = 80.0, -- minimum coverage threshold (used for highlighting)
          },
          lang = {
            -- customize language specific settings
          },
        }
      end,
    },
    {
      'easymotion/vim-easymotion',
      config = function()
        vim.keymap.set({ 'n', 'v' }, '<leader>f', '<Plug>(easymotion-bd-f)', {
          desc = 'Easymotion [f]ind',
        })
      end,
    },
    {
      'FooSoft/vim-argwrap',
      config = function()
        vim.keymap.set('n', '<leader>a', '<cmd>ArgWrap<cr>', {
          desc = 'Wrap/Unwrap [a]rguments',
        })
      end,
    },
    {
      'mfussenegger/nvim-dap',
      lazy = true,
      config = function()
        local dap = require 'dap'
        local daprepl = require 'dap.repl'
        local map = function(key, f, opts)
          vim.keymap.set('n', key, f, opts)
        end
        map('<M-B>', dap.toggle_breakpoint, {
          desc = 'DBG: Toggle debugging [B]reakpoint',
        })
        map('<M-c>', dap.continue, {
          desc = 'DBG: [C]ontinue or start debugging',
        })
        map('<M-d>', dap.step_over, {
          desc = 'DBG: [D]own',
        })
        map('<M-i>', dap.step_into, {
          desc = 'DBG: [I]nto',
        })
        map('<M-o>', dap.step_out, {
          desc = 'DBG: [O]ut',
        })
        map('<M-r>', daprepl.toggle, {
          desc = 'DBG: [R]epl',
        })
        -- macOS equivalent keys
        map('ı', dap.toggle_breakpoint, {
          desc = 'DBG: Toggle debugging [B]reakpoint',
        })
        map('ç', dap.continue, {
          desc = 'DBG: [C]ontinue or start debugging',
        })
        map('∂', dap.step_over, {
          desc = 'DBG: [D]own',
        })
        -- vim.keymap.set('n', '<M-i>', dap.step_into, { desc = 'DBG: [I]nto', })
        map('ø', dap.step_out, {
          desc = 'DBG: [O]ut',
        })
        map('®', daprepl.toggle, {
          desc = 'DBG: [R]epl',
        })
      end,
    },
    {
      'leoluz/nvim-dap-go',
      dependencies = {
        'mfussenegger/nvim-dap',
      },
      config = function()
        local dapgo = require 'dap-go'
        dapgo.setup()
        local map = function(key, f, opts)
          vim.keymap.set('n', key, f, opts)
        end
        map('<M-t>', dapgo.debug_test, {
          desc = 'DBG: Go debug [T]est',
        })
        -- macOS equivalent keys
        map('†', dapgo.debug_test, {
          desc = 'DBG: Go debug [T]est',
        })
      end,
    },
    {
      'mfussenegger/nvim-dap-python',
      dependencies = {
        'mfussenegger/nvim-dap',
      },
      config = function()
        local dappy = require 'dap-python'
        -- requires:
        --   echo 'eval "$(pyenv virtualenv-init -)"' >> .bashrc
        --   pyenv virtualenv debugpy
        --   pyenv activate debugpy
        --   pip install debugpy
        dappy.setup(os.getenv 'HOME' .. '/.pyenv/versions/debugpy/bin/python')
        local map = function(key, f, opts)
          vim.keymap.set('n', key, f, opts)
        end
        map('<M-f>', dappy.test_method, {
          desc = 'DBG: Python debug [M]ethod',
        })
        map('<M-k>', dappy.test_class, {
          desc = 'DBG: Python debug [K]lass',
        })
        -- macOS equivalent keys
        map('ƒ', dappy.test_method, {
          desc = 'DBG: Python debug [M]ethod',
        })
        map('˚', dappy.test_class, {
          desc = 'DBG: Python debug [K]lass',
        })
      end,
    },
    {
      'rcarriga/nvim-dap-ui',
      dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-neotest/nvim-nio',
      },
      config = function()
        local dapui = require 'dapui'
        dapui.setup()
        local map = function(key, f, opts)
          vim.keymap.set('n', key, f, opts)
        end
        map('<M-b>', dapui.toggle, {
          desc = 'DBG: Toggle De[B]ugger',
        })
        -- macOS equivalent keys
        map('∫', dapui.toggle, {
          desc = 'DBG: Toggle De[B]ugger',
        })

        vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939' })
        vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379' })
        vim.fn.sign_define('DapBreakpoint', {
          text = '',
          texthl = 'DapBreakpoint',
        })
        vim.fn.sign_define('DapStopped', {
          text = '',
          texthl = 'DapStopped',
        })
      end,
    },
    'tpope/vim-eunuch',
    'tpope/vim-repeat',
    -- 'tpope/vim-surround', -- see echasnovski/mini.nvim
    'tpope/tpope-vim-abolish',
    os.getenv 'COPILOT' ~= nil
        and {
          'zbirenbaum/copilot-cmp',
          dependencies = { 'hrsh7th/nvim-cmp' }, -- Ensure nvim-cmp is installed
          config = function()
            require('copilot_cmp').setup()
          end,
        }
      or {},
    os.getenv 'COPILOT' ~= nil
        and {
          'github/copilot.vim',
          config = function()
            vim.g.copilot_autostart = true -- Enable autostart
            vim.g.copilot_no_tab_map = true -- Disable default Tab mapping
            -- accept suggestion
            vim.api.nvim_set_keymap(
              'i',
              '<C-g>',
              'copilot#Accept("<CR>")',
              { silent = true, expr = true }
            )
            -- accept word
            vim.api.nvim_set_keymap(
              'i',
              '<C-f>',
              'copilot#AcceptWord()',
              { silent = true, expr = true }
            )
            -- next suggestion
            vim.api.nvim_set_keymap(
              'i',
              '<C-j>',
              'copilot#Next()',
              { silent = true, expr = true }
            )
            -- previous suggestion
            vim.api.nvim_set_keymap(
              'i',
              '<C-k>',
              'copilot#Previous()',
              { silent = true, expr = true }
            )
          end,
        }
      or {},
    -- See `:help gitsigns` to understand what the configuration keys do
    { -- Adds git related signs to the gutter, as well as utilities for managing changes
      'lewis6991/gitsigns.nvim',
      opts = {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
          local gitsigns = require 'gitsigns'

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal { ']c', bang = true }
            else
              gitsigns.nav_hunk 'next'
            end
          end, {
            desc = 'Next [C]hange',
          })

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal { '[c', bang = true }
            else
              gitsigns.nav_hunk 'prev'
            end
          end, {
            desc = 'Previous [C]hange',
          })

          -- Actions
          map('n', '<leader>hs', gitsigns.stage_hunk, {
            desc = '[H]unk [S]tage',
          })
          map('n', '<leader>hr', gitsigns.reset_hunk, {
            desc = '[H]unk [R]eset',
          })
          map('v', '<leader>hs', function()
            gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, {
            desc = '[H]unk [S]tage',
          })
          map('v', '<leader>hr', function()
            gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, {
            desc = '[H]unk [R]eset',
          })
          map('n', '<leader>hS', gitsigns.stage_buffer, {
            desc = 'All [H]unks [S]tage',
          })
          map('n', '<leader>hu', gitsigns.stage_hunk, {
            desc = '[H]unk [U]nstage',
          }) -- stage_hunk also unstages
          map('n', '<leader>hR', gitsigns.reset_buffer, {
            desc = 'All [H]unks [R]eset',
          })
          map('n', '<leader>hp', gitsigns.preview_hunk, {
            desc = '[H]unk [P]review',
          })
          map('n', '<leader>hb', function()
            gitsigns.blame_line { full = true }
          end, { desc = '[H]unk [B]lame' })
          map('n', '<leader>tb', gitsigns.toggle_current_line_blame, {
            desc = '[T]oggle [B]lame',
          })
          map('n', '<leader>hd', gitsigns.diffthis, {
            desc = '[H]unk [D]iff',
          })
          map('n', '<leader>hD', function()
            gitsigns.diffthis '~'
          end, {
            desc = 'All [H]unks [D]iff',
          })
          map('n', '<leader>td', gitsigns.preview_hunk_inline, {
            desc = '[T]oggle [D]iff',
          })

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', {
            desc = '[I]nner [H]unk',
          })
        end,
      },
    },

    -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
    --
    -- This is often very useful to both group configuration, as well as handle
    -- lazy loading plugins that don't need to be loaded immediately at startup.
    --
    -- For example, in the following configuration, we use:
    --  event = 'VimEnter'
    --
    -- which loads which-key before all the UI elements are loaded. Events can be
    -- normal autocommands events (`:help autocmd-events`).
    --
    -- Then, because we use the `opts` key (recommended), the configuration runs
    -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

    { -- Useful plugin to show you pending keybinds.
      'folke/which-key.nvim',
      event = 'VimEnter', -- Sets the loading event to 'VimEnter'
      opts = {
        -- delay between pressing a key and opening which-key (milliseconds)
        -- this setting is independent of vim.opt.timeoutlen
        delay = 0,
        icons = {
          -- set icon mappings to true if you have a Nerd Font
          mappings = vim.g.have_nerd_font,
          -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
          -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
          keys = vim.g.have_nerd_font and {} or {
            Up = '<Up> ',
            Down = '<Down> ',
            Left = '<Left> ',
            Right = '<Right> ',
            C = '<C-…> ',
            M = '<M-…> ',
            D = '<D-…> ',
            S = '<S-…> ',
            CR = '<CR> ',
            Esc = '<Esc> ',
            ScrollWheelDown = '<ScrollWheelDown> ',
            ScrollWheelUp = '<ScrollWheelUp> ',
            NL = '<NL> ',
            BS = '<BS> ',
            Space = '<Space> ',
            Tab = '<Tab> ',
            F1 = '<F1>',
            F2 = '<F2>',
            F3 = '<F3>',
            F4 = '<F4>',
            F5 = '<F5>',
            F6 = '<F6>',
            F7 = '<F7>',
            F8 = '<F8>',
            F9 = '<F9>',
            F10 = '<F10>',
            F11 = '<F11>',
            F12 = '<F12>',
          },
        },

        -- Document existing key chains
        spec = {
          { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
          { '<leader>d', group = '[D]ocument' },
          { '<leader>r', group = '[R]ename' },
          { '<leader>s', group = '[S]earch' },
          { '<leader>w', group = '[W]orkspace' },
          { '<leader>t', group = '[T]oggle' },
          { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        },
      },
    },
    { -- Fuzzy Finder (files, lsp, etc)
      'nvim-telescope/telescope.nvim',
      event = 'VimEnter',
      branch = '0.1.x',
      dependencies = {
        'nvim-lua/plenary.nvim',
        { -- If encountering errors, see telescope-fzf-native README for installation instructions
          'nvim-telescope/telescope-fzf-native.nvim',

          -- `build` is used to run some command when the plugin is installed/updated.
          -- This is only run then, not every time Neovim starts up.
          build = 'make',

          -- `cond` is a condition used to determine whether this plugin should be
          -- installed and loaded.
          cond = function()
            return vim.fn.executable 'make' == 1
          end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },

        -- Useful for getting pretty icons, but requires a Nerd Font.
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
      },
      config = function()
        -- Telescope is a fuzzy finder that comes with a lot of different things that
        -- it can fuzzy find! It's more than just a "file finder", it can search
        -- many different aspects of Neovim, your workspace, LSP, and more!
        --
        -- The easiest way to use Telescope, is to start by doing something like:
        --  :Telescope help_tags
        --
        -- After running this command, a window will open up and you're able to
        -- type in the prompt window. You'll see a list of `help_tags` options and
        -- a corresponding preview of the help.
        --
        -- Two important keymaps to use while in Telescope are:
        --  - Insert mode: <c-/>
        --  - Normal mode: ?
        --
        -- This opens a window that shows you all of the keymaps for the current
        -- Telescope picker. This is really useful to discover what Telescope can
        -- do as well as how to actually do it!

        -- [[ Configure Telescope ]]
        -- See `:help telescope` and `:help telescope.setup()`
        require('telescope').setup {
          -- You can put your default mappings / updates / etc. in here
          --  All the info you're looking for is in `:help telescope.setup()`
          --
          -- defaults = {
          --   mappings = {
          --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
          --   },
          -- },
          -- pickers = {}
          extensions = {
            ['ui-select'] = {
              require('telescope.themes').get_dropdown(),
            },
          },
        }

        -- Enable Telescope extensions if they are installed
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        -- See `:help telescope.builtin`
        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, {
          desc = '[S]earch [H]elp',
        })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, {
          desc = '[S]earch [K]eymaps',
        })
        vim.keymap.set('n', '<leader>e', function()
          builtin.find_files { hidden = true }
        end, {
          desc = 'S[e]arch files',
        })
        vim.keymap.set('n', '<leader>ss', builtin.builtin, {
          desc = '[S]earch [S]elect Telescope',
        })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, {
          desc = '[S]earch current [W]ord',
        })
        vim.keymap.set('n', '<leader>r', builtin.live_grep, {
          desc = 'Search by [R]ipgrep',
        })
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, {
          desc = '[S]earch [D]iagnostics',
        })
        vim.keymap.set('n', '<leader>sr', builtin.resume, {
          desc = '[S]earch [R]esume',
        })
        vim.keymap.set('n', '<leader>s.', builtin.oldfiles, {
          desc = '[S]earch Recent Files ("." for repeat)',
        })
        vim.keymap.set('n', '<leader>b', builtin.buffers, {
          desc = 'Find existing [B]uffers',
        })

        -- Slightly advanced example of overriding default behavior and theme
        vim.keymap.set('n', '<leader>/', function()
          -- You can pass additional configuration to Telescope to change the theme, layout, etc.
          builtin.current_buffer_fuzzy_find(
            require('telescope.themes').get_dropdown {
              winblend = 10,
              previewer = false,
            }
          )
        end, {
          desc = '[/] Fuzzily search in current buffer',
        })

        -- It's also possible to pass additional configuration options.
        --  See `:help telescope.builtin.live_grep()` for information about particular keys
        vim.keymap.set('n', '<leader>s/', function()
          builtin.live_grep {
            grep_open_files = true,
            prompt_title = 'Live Grep in Open Files',
          }
        end, {
          desc = '[S]earch [/] in Open Files',
        })

        -- Shortcut for searching your Neovim configuration files
        vim.keymap.set('n', '<leader>sn', function()
          builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, {
          desc = '[S]earch [N]eovim files',
        })
      end,
    },

    -- LSP Plugins
    {
      -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          -- Load luvit types when the `vim.uv` word is found
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },
    {
      -- Main LSP Configuration
      'neovim/nvim-lspconfig',
      dependencies = {
        -- Automatically install LSPs and related tools to stdpath for Neovim
        -- Mason must be loaded before its dependents so we need to set it up here.
        -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
        { 'williamboman/mason.nvim', opts = {} },
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',

        -- Useful status updates for LSP.
        { 'j-hui/fidget.nvim', opts = {} },

        -- Allows extra capabilities provided by nvim-cmp
        'hrsh7th/cmp-nvim-lsp',
      },
      config = function()
        --  This function gets run when an LSP attaches to a particular buffer.
        --    That is to say, every time a new file is opened that is associated with
        --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
        --    function will be executed to configure the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup(
            'kickstart-lsp-attach',
            { clear = true }
          ),
          callback = function(event)
            -- NOTE: Remember that Lua is a real programming language, and as such it is possible
            -- to define small helper and utility functions so you don't have to repeat yourself.
            --
            -- In this case, we create a function that lets us more easily define mappings specific
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            local map = function(keys, func, desc, mode)
              mode = mode or 'n'
              vim.keymap.set(mode, keys, func, {
                buffer = event.buf,
                desc = 'LSP: ' .. desc,
              })
            end

            -- Jump to the definition of the word under your cursor.
            --  This is where a variable was first declared, or where a function is defined, etc.
            --  To jump back, press <C-t>.
            map(
              'gd',
              require('telescope.builtin').lsp_definitions,
              '[G]oto [D]efinition'
            )

            -- Find references for the word under your cursor.
            map(
              'gr',
              require('telescope.builtin').lsp_references,
              '[G]oto [R]eferences'
            )

            -- Jump to the implementation of the word under your cursor.
            --  Useful when your language has ways of declaring types without an actual implementation.
            map(
              'gI',
              require('telescope.builtin').lsp_implementations,
              '[G]oto [I]mplementation'
            )

            -- Jump to the type of the word under your cursor.
            --  Useful when you're not sure what type a variable is and you want to see
            --  the definition of its *type*, not where it was *defined*.
            map(
              '<leader>D',
              require('telescope.builtin').lsp_type_definitions,
              'Type [D]efinition'
            )

            -- Fuzzy find all the symbols in your current document.
            --  Symbols are things like variables, functions, types, etc.
            map(
              '<leader>ds',
              require('telescope.builtin').lsp_document_symbols,
              '[D]ocument [S]ymbols'
            )

            -- Fuzzy find all the symbols in your current workspace.
            --  Similar to document symbols, except searches over your entire project.
            map(
              '<leader>ws',
              require('telescope.builtin').lsp_dynamic_workspace_symbols,
              '[W]orkspace [S]ymbols'
            )

            -- Rename the variable under your cursor.
            --  Most Language Servers support renaming across files, etc.
            map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

            -- Execute a code action, usually your cursor needs to be on top of an error
            -- or a suggestion from your LSP for this to activate.
            map(
              '<leader>ca',
              vim.lsp.buf.code_action,
              '[C]ode [A]ction',
              { 'n', 'x' }
            )

            -- Show diagnostics for the word under your cursor.
            -- For its configs, see vim.diagnostic.config
            map('<leader>E', vim.diagnostic.open_float, '[E]rror')

            -- WARN: This is not Goto Definition, this is Goto Declaration.
            --  For example, in C this would take you to the header.
            map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

            -- The following two autocommands are used to highlight references of the
            -- word under your cursor when your cursor rests there for a little while.
            --    See `:help CursorHold` for information about when this is executed
            --
            -- When you move your cursor, the highlights will be cleared (the second autocommand).
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if
              client
              and client:supports_method(
                vim.lsp.protocol.Methods.textDocument_documentHighlight
              )
            then
              local highlight_augroup = vim.api.nvim_create_augroup(
                'kickstart-lsp-highlight',
                { clear = false }
              )
              vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
              })

              vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
              })

              vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup(
                  'kickstart-lsp-detach',
                  { clear = true }
                ),
                callback = function(event2)
                  vim.lsp.buf.clear_references()
                  vim.api.nvim_clear_autocmds {
                    group = 'kickstart-lsp-highlight',
                    buffer = event2.buf,
                  }
                end,
              })
            end

            -- The following code creates a keymap to toggle inlay hints in your
            -- code, if the language server you are using supports them
            --
            -- This may be unwanted, since they displace some of your code
            if
              client
              and client:supports_method(
                vim.lsp.protocol.Methods.textDocument_inlayHint
              )
            then
              map('<leader>th', function()
                vim.lsp.inlay_hint.enable(
                  not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }
                )
              end, '[T]oggle Inlay [H]ints')
            end
          end,
        })

        -- Change diagnostic symbols in the sign column (gutter)
        if vim.g.have_nerd_font then
          local signs =
            { ERROR = '', WARN = '', INFO = '', HINT = '' }
          local diagnostic_signs = {}
          for type, icon in pairs(signs) do
            diagnostic_signs[vim.diagnostic.severity[type]] = icon
          end
          vim.diagnostic.config { signs = { text = diagnostic_signs } }
        end

        -- LSP servers and clients are able to communicate to each other what features they support.
        --  By default, Neovim doesn't support everything that is in the LSP specification.
        --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
        --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend(
          'force',
          capabilities,
          require('cmp_nvim_lsp').default_capabilities()
        )

        -- Enable the following language servers
        --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
        --
        --  Add any additional override configuration in the following tables. Available keys are:
        --  - cmd (table): Override the default command used to start the server
        --  - filetypes (table): Override the default list of associated filetypes for the server
        --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
        --  - settings (table): Override the default settings passed when initializing the server.
        --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
        local servers = {
          -- clangd = {},
          gopls = {},
          pyright = {},
          rust_analyzer = {},
          -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
          --
          -- Some languages (like typescript) have entire language plugins that can be useful:
          --    https://github.com/pmizio/typescript-tools.nvim
          --
          -- But for many setups, the LSP (`ts_ls`) will work just fine
          -- ts_ls = {},
          --

          lua_ls = {
            -- cmd = { ... },
            -- filetypes = { ... },
            -- capabilities = {},
            settings = {
              Lua = {
                completion = {
                  callSnippet = 'Replace',
                },
                -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                -- diagnostics = { disable = { 'missing-fields' } },
              },
            },
          },
        }

        -- Ensure the servers and tools above are installed
        --
        -- To check the current status of installed tools and/or manually install
        -- other tools, you can run
        --    :Mason
        --
        -- You can press `g?` for help in this menu.
        --
        -- `mason` had to be setup earlier: to configure its options see the
        -- `dependencies` table for `nvim-lspconfig` above.
        --
        -- You can add other tools here that you want Mason to install
        -- for you, so that they are available from within Neovim.
        local ensure_installed = vim.tbl_keys(servers or {})
        require('mason-tool-installer').setup {
          ensure_installed = ensure_installed,
        }

        require('mason-lspconfig').setup {
          ensure_installed = ensure_installed,
          automatic_enable = true,
        }
      end,
    },

    { -- Autoformat
      'stevearc/conform.nvim',
      event = { 'BufWritePre' },
      cmd = { 'ConformInfo' },
      keys = {
        {
          '<leader>F',
          function()
            require('conform').format { async = true, lsp_format = 'fallback' }
          end,
          mode = '',
          desc = '[F]ormat buffer',
        },
      },
      formatters = {
        golangci_lint = {
          prepend_args = { '--config', '.golangci-lint.y*ml' },
        },
      },
      opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
          -- Disable "format_on_save lsp_fallback" for languages that don't
          -- have a well standardized coding style. You can add additional
          -- languages here or re-enable it for the disabled ones.
          local disable_filetypes = { c = true, cpp = true }
          local lsp_format_opt
          if disable_filetypes[vim.bo[bufnr].filetype] then
            lsp_format_opt = 'never'
          else
            lsp_format_opt = 'fallback'
          end
          return {
            timeout_ms = 500,
            lsp_format = lsp_format_opt,
          }
        end,
        formatters_by_ft = {
          lua = { 'stylua' },
          go = {
            'golangci-lint',
            'goimports',
            stop_after_first = true,
          },
          -- Conform can also run multiple formatters sequentially
          -- python = { "isort", "black" },
          --
          -- You can use 'stop_after_first' to run the first available formatter from the list
          -- javascript = { "prettierd", "prettier", stop_after_first = true },
        },
      },
    },

    { -- Autocompletion
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        {
          'L3MON4D3/LuaSnip',
          build = (function()
            -- Build Step is needed for regex support in snippets.
            -- This step is not supported in many windows environments.
            -- Remove the below condition to re-enable on windows.
            if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
              return
            end
            return 'make install_jsregexp'
          end)(),
          dependencies = {
            -- `friendly-snippets` contains a variety of premade snippets.
            --    See the README about individual language/framework/plugin snippets:
            --    https://github.com/rafamadriz/friendly-snippets
            -- {
            --   'rafamadriz/friendly-snippets',
            --   config = function()
            --     require('luasnip.loaders.from_vscode').lazy_load()
            --   end,
            -- },
          },
        },
        'saadparwaiz1/cmp_luasnip',

        -- Adds other completion capabilities.
        --  nvim-cmp does not ship with all sources by default. They are split
        --  into multiple repos for maintenance purposes.
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
      },
      config = function()
        -- See `:help cmp`
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'
        luasnip.config.setup {}

        cmp.setup {
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          completion = { completeopt = 'menu,menuone,noinsert' },

          -- For an understanding of why these mappings were
          -- chosen, you will need to read `:help ins-completion`
          --
          -- No, but seriously. Please read `:help ins-completion`, it is really good!
          mapping = cmp.mapping.preset.insert {
            -- Select the [n]ext item
            ['<C-n>'] = cmp.mapping.select_next_item(),
            -- Select the [p]revious item
            ['<C-p>'] = cmp.mapping.select_prev_item(),

            -- Scroll the documentation window [b]ack / [f]orward
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),

            -- Accept ([y]es) the completion.
            --  This will auto-import if your LSP supports it.
            --  This will expand snippets if the LSP sent a snippet.
            ['<C-y>'] = cmp.mapping.confirm { select = true },

            -- If you prefer more traditional completion keymaps,
            -- you can uncomment the following lines
            --['<CR>'] = cmp.mapping.confirm { select = true },
            --['<Tab>'] = cmp.mapping.select_next_item(),
            --['<S-Tab>'] = cmp.mapping.select_prev_item(),

            -- Manually trigger a completion from nvim-cmp.
            --  Generally you don't need this, because nvim-cmp will display
            --  completions whenever it has completion options available.
            -- ['<C-Space>'] = cmp.mapping.complete {},

            -- Think of <c-l> as moving to the right of your snippet expansion.
            --  So if you have a snippet that's like:
            --  function $name($args)
            --    $body
            --  end
            --
            -- <c-l> will move you to the right of each of the expansion locations.
            -- <c-h> is similar, except moving you backwards.
            -- ['<C-l>'] = cmp.mapping(function()
            --   if luasnip.expand_or_locally_jumpable() then
            --     luasnip.expand_or_jump()
            --   end
            -- end, { 'i', 's' }),
            -- ['<C-h>'] = cmp.mapping(function()
            --   if luasnip.locally_jumpable(-1) then
            --     luasnip.jump(-1)
            --   end
            -- end, { 'i', 's' }),

            -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
            --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
          },
          sources = {
            {
              name = 'lazydev',
              -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
              group_index = 0,
            },
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'path' },
          },
        }
      end,
    },

    { -- You can easily change to a different colorscheme.
      -- Change the name of the colorscheme plugin below, and then
      -- change the command in the config to whatever the name of that colorscheme is.
      --
      -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
      'folke/tokyonight.nvim',
      priority = 1000, -- Make sure to load this before all the other start plugins.
      init = function()
        -- Load the colorscheme here.
        -- Like many other themes, this one has different styles, and you could load
        -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
        vim.cmd.colorscheme 'tokyonight-night'

        -- You can configure highlights by doing something like:
        vim.cmd.hi 'Comment guifg=grey'
        vim.cmd.hi 'Normal ctermbg=None guibg=None'
      end,
    },

    -- Highlight todo, notes, etc in comments
    {
      'folke/todo-comments.nvim',
      event = 'VimEnter',
      dependencies = { 'nvim-lua/plenary.nvim' },
      opts = { signs = false },
    },

    { -- Collection of various small independent plugins/modules
      'echasnovski/mini.nvim',
      config = function()
        -- Better Around/Inside textobjects
        --
        -- Examples:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
        --  - ci'  - [C]hange [I]nside [']quote
        require('mini.ai').setup { n_lines = 500 }

        -- Add/delete/replace surroundings (brackets, quotes, etc.)
        --
        -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        -- - sd'   - [S]urround [D]elete [']quotes
        -- - sr)'  - [S]urround [R]eplace [)] [']
        require('mini.surround').setup()

        -- Simple and easy statusline.
        --  You could remove this setup call if you don't like it,
        --  and try some other statusline plugin
        local statusline = require 'mini.statusline'
        -- set use_icons to true if you have a Nerd Font
        local filename = function()
          if vim.bo.buftype == 'terminal' then
            return '%t'
          else
            return '%f%m%r'
          end
        end
        statusline.setup {
          use_icons = vim.g.have_nerd_font,
          content = {
            active = function()
              local mode, mode_hl =
                statusline.section_mode { trunc_width = 120 }
              -- local git = statusline.section_git { trunc_width = 40 }
              -- local diff = statusline.section_diff { trunc_width = 75 }
              -- local lsp = statusline.section_lsp { trunc_width = 75 }
              local diagnostics =
                statusline.section_diagnostics { trunc_width = 75 }
              -- local filename = statusline.section_filename { trunc_width = 140 }
              -- local fileinfo = statusline.section_fileinfo { trunc_width = 120 }
              -- local location = statusline.section_location { trunc_width = 75 }
              -- local search = statusline.section_searchcount { trunc_width = 75 }
              return statusline.combine_groups {
                { hl = mode_hl, strings = { mode } },
                {
                  hl = 'MiniStatuslineDevinfo',
                  strings = { diagnostics },
                },
                '%<', -- Mark general truncate point
                { hl = 'MiniStatuslineFilename', strings = { filename() } },
                '%=', -- End left alignment
                {
                  hl = 'MiniStatuslineFileinfo',
                  strings = { vim.bo.filetype },
                },
                { hl = mode_hl, strings = { '%2v %l/%L' } },
              }
            end,
            inactive = function()
              return statusline.combine_groups {
                { hl = 'MiniStatuslineFilename', strings = { filename() } },
              }
            end,
          },
        }

        -- You can configure sections in the statusline by overriding their
        -- default behavior. For example, here we set the section for
        -- cursor location to LINE:COLUMN
        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_location = function()
          return '%2l:%-2v'
        end

        -- ... and there is more!
        --  Check out: https://github.com/echasnovski/mini.nvim
      end,
    },
    { -- Highlight, edit, and navigate code
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      main = 'nvim-treesitter.configs', -- Sets main module to use for opts
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
      opts = {
        ensure_installed = {
          'bash',
          'c',
          'diff',
          'html',
          'lua',
          'luadoc',
          'markdown',
          'markdown_inline',
          'query',
          'vim',
          'vimdoc',
        },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = {
          enable = true,
          -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
          --  If you are experiencing weird indenting issues, add the language to
          --  the list of additional_vim_regex_highlighting and disabled languages for indent.
          additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = { enable = true, disable = { 'ruby' } },
      },
      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    },

    -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
    -- init.lua. If you want these files, they are in the repository, so you can just download them and
    -- place them in the correct locations.

    -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
    --
    --  Here are some example plugins that I've included in the Kickstart repository.
    --  Uncomment any of the lines below to enable them (you will need to restart nvim).
    --
    -- require 'kickstart.plugins.debug',
    -- require 'kickstart.plugins.indent_line',
    -- require 'kickstart.plugins.lint',
    -- require 'kickstart.plugins.autopairs',
    -- require 'kickstart.plugins.neo-tree',
    -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

    -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
    --    This is the easiest way to modularize your config.
    --
    --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
    { import = 'custom.plugins' },
    --
    -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
    -- Or use telescope!
    -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
    -- you can continue same window with `<space>sr` which resumes last telescope search
  },
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
