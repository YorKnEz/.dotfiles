return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = function()
      local status_ok, nvim_tree = pcall(require, "nvim-tree")
      if not status_ok then
        print(nvim_tree)
        return {}
      end

      local function on_attach(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return { desc = "nvim-tree-api." .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- Default mappings. Feel free to modify or remove as you wish.
        --
        -- BEGIN_DEFAULT_ON_ATTACH
        -- api.tree
        vim.keymap.set("n", "g?", api.tree.toggle_help, opts("tree: Help"))
        vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("tree: CD"))
        vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("tree: CD"))
        vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("tree: Up"))
        vim.keymap.set("n", "E", api.tree.expand_all, opts("tree: Expand All"))
        vim.keymap.set("n", "W", api.tree.collapse_all, opts("tree: Collapse"))
        vim.keymap.set("n", "q", api.tree.close, opts("tree: Close"))
        vim.keymap.set("n", "R", api.tree.reload, opts("tree: Refresh"))
        vim.keymap.set("n", "S", api.tree.search_node, opts("tree: Search"))
        vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("tree: Toggle Hidden"))
        vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("tree: Toggle Dotfiles"))
        vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("tree: Toggle Git Ignore"))
        vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts("tree: Toggle Git Clean"))
        vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("tree: Toggle No Buffer"))
        -- api.node
        vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
        -- api.node.open
        vim.keymap.set("n", "o", api.node.open.edit, opts("node.open: Open"))
        vim.keymap.set("n", "<CR>", api.node.open.edit, opts("node.open: Open"))
        vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("node.open: Open"))
        vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("node.open: Open Preview"))
        vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("node.open: New Tab"))
        vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts("node.open: In Place"))
        vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("node.open: Vertical Split"))
        vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("node.open: Horizontal Split"))
        vim.keymap.set("n", "O", api.node.open.no_window_picker, opts("node.open: No Window Picker"))
        -- api.node.navigate
        vim.keymap.set("n", "P", api.node.navigate.parent, opts("node.navigate: Parent Directory"))
        vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("node.navigate: Close Directory"))
        vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("node.navigate: First Sibling"))
        vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("node.navigate: Last Sibling"))
        vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("node.navigate: Next Sibling"))
        vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("node.navigate: Previous Sibling"))
        vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("node.navigate: Next Git"))
        vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("node.navigate: Prev Git"))
        vim.keymap.set("n", "]e", api.node.navigate.diagnostics.next, opts("node.navigate: Next Diagnostic"))
        vim.keymap.set("n", "[e", api.node.navigate.diagnostics.prev, opts("node.navigate: Prev Diagnostic"))
        -- api.node.run
        vim.keymap.set("n", ".", api.node.run.cmd, opts("node.run: Run Command"))
        vim.keymap.set("n", "s", api.node.run.system, opts("node.run: Run System"))
        -- api.fs
        vim.keymap.set("n", "a", api.fs.create, opts("fs: Create"))
        vim.keymap.set("n", "r", api.fs.rename, opts("fs: Rename"))
        vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("fs: Rename: Omit Filename"))
        vim.keymap.set("n", "e", api.fs.rename_basename, opts("fs: Rename: Basename"))
        vim.keymap.set("n", "c", api.fs.copy.node, opts("fs: Copy"))
        vim.keymap.set("n", "y", api.fs.copy.filename, opts("fs: Copy Name"))
        vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("fs: Copy Absolute Path"))
        vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("fs: Copy Relative Path"))
        vim.keymap.set("n", "p", api.fs.paste, opts("fs: Paste"))
        vim.keymap.set("n", "x", api.fs.cut, opts("fs: Cut"))
        vim.keymap.set("n", "d", api.fs.remove, opts("fs: Delete"))
        vim.keymap.set("n", "D", api.fs.trash, opts("fs: Trash"))
        -- api.marks
        vim.keymap.set("n", "bmv", api.marks.bulk.move, opts("marks: Move Bookmarked"))
        vim.keymap.set("n", "m", api.marks.toggle, opts("marks: Toggle Bookmark"))
        -- api.live_filter
        vim.keymap.set("n", "F", api.live_filter.clear, opts("live_filter: Clean Filter"))
        vim.keymap.set("n", "f", api.live_filter.start, opts("live_filter: Filter"))
        -- END_DEFAULT_ON_ATTACH


        -- Mappings migrated from view.mappings.list
        --
        -- You will need to insert "your code goes here" for any mappings with a custom action_cb
        vim.keymap.set("n", "h", api.node.open.horizontal, opts("Open: Horizontal Split"))
        vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
      end

      return {
        on_attach = on_attach,
        hijack_cursor = true,
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          root_folder_label = ":t",
          icons = {
            glyphs = {
              git = {
                unstaged = "",
              },
            },
          },
        },
        update_focused_file = {
          enable = true,
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = {
            hint = "󰌵",
            info = "",
            warning = "",
            error = "",
          },
        },
      }
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)

      local api = require("nvim-tree.api")

      -- Open NvimTree and an empty buffer if the user opened a directory
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if api.tree.is_tree_buf() then        -- user opened a folder in nvim (the current buffer is nvimtree)
            vim.cmd("vnew")                     -- open an empty buffer in a split window (this keeps nvimtree open)
            api.tree.resize()                   -- resize nvimtree to normal size
          end
        end,
      })

      -- Close nvim if NvimTree is the only window left
      vim.api.nvim_create_autocmd("WinClosed", {
        callback = function(data)
          -- WinClosed is called before actually closing the window so in order to close nvim we need to have:
          local close_nvim = api.tree.is_visible()              -- nvimtree visible
              and vim.fn.winnr("$") == 2                        -- only 2 windows opened (nvimtree + other window)
              and vim.fn.str2nr(data.match) ~= api.tree.winid() -- the window closed is not nvimtree

          -- so this closes nvim only if there were two windows left, one of which was nvim tree and the other was the closed window
          if close_nvim then
            -- When Lazy does updates, it opens itself before giving nvimtree a chance to open, this will confuse the autocommand
            if vim.bo.filetype == "lazy" then -- if the Lazy window is the one that got closed, then open an empty buffer
              vim.cmd("vnew")                 -- open an empty buffer in a split window (this keeps nvimtree open)
              api.tree.resize()               -- resize nvimtree to normal size
            else                              -- else just quit nvim
              vim.cmd('qa!')                  -- exit without saving
            end
          end
        end,
      })
    end
  }
}
