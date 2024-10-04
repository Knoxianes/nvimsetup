return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',

            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },

        { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
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

        local function find_git_root()
            -- Use the current buffer's path as the starting point for the git search
            local current_file = vim.api.nvim_buf_get_name(0)
            local current_dir
            local cwd = vim.fn.getcwd()
            -- If the buffer is not associated with a file, return nil
            if current_file == "" then
                current_dir = cwd
            else
                -- Extract the directory from the current file's path
                current_dir = vim.fn.fnamemodify(current_file, ":h")
            end

            -- Find the Git root directory from the current file's path
            local git_root = vim.fn.systemlist("git -C " ..
                vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
            if vim.v.shell_error ~= 0 then
                print("Not a git repository. Searching on current working directory")
                return cwd
            end
            return git_root
        end

        local function live_grep_git_root()
            local git_root = find_git_root()
            if git_root then
                require('telescope.builtin').live_grep({
                    search_dirs = { git_root },
                })
            end
        end

        vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

        -- See `:help telescope.builtin`
        vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
            { desc = '[?] Find recently opened files' })
        vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers,
            { desc = '[ ] Find existing buffers' })
        vim.keymap.set('n', '<leader>/', function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })

        vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
        vim.keymap.set('n', '<leader>pf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>ph', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>pw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>pg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>pG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
        vim.keymap.set('n', '<leader>pd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>pr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
    end,
}
