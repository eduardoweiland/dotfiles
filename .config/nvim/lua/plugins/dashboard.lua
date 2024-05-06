return {
  {
    'nvimdev/dashboard-nvim',
    event = { 'VimEnter' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
      local opts = {
        theme = 'doom',
        hide = {
          statusline = false,
          tabline = false,
          winbar = false,
        },
        config = {
          header = {
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '██████╗  ██████╗ ███╗   ██╗████████╗    ██████╗  █████╗ ███╗   ██╗██╗ ██████╗',
            '██╔══██╗██╔═══██╗████╗  ██║╚══██╔══╝    ██╔══██╗██╔══██╗████╗  ██║██║██╔════╝',
            '██║  ██║██║   ██║██╔██╗ ██║   ██║       ██████╔╝███████║██╔██╗ ██║██║██║     ',
            '██║  ██║██║   ██║██║╚██╗██║   ██║       ██╔═══╝ ██╔══██║██║╚██╗██║██║██║     ',
            '██████╔╝╚██████╔╝██║ ╚████║   ██║       ██║     ██║  ██║██║ ╚████║██║╚██████╗',
            '╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝       ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝ ╚═════╝',
            '',
            '',
            '',
            '',
          },
          center = {
            { icon = ' ', desc = ' Find File',    key = 'f', action = 'Telescope find_files'                    },
            { icon = ' ', desc = ' New File',     key = 'n', action = 'ene | startinsert'                       },
            { icon = ' ', desc = ' Recent Files', key = 'r', action = 'Telescope oldfiles'                      },
            { icon = ' ', desc = ' Find Text',    key = 'g', action = 'Telescope live_grep'                     },
            { icon = ' ', desc = ' Config',       key = 'c', action = 'Telescope find_files cwd=~/.config/nvim' },
            { icon = ' ', desc = ' Plugins',      key = 'p', action = 'Lazy'                                    },
            { icon = ' ', desc = ' Quit',         key = 'q', action = 'qa'                                      },
          },
          footer = {
            '',
            'So long and thanks for all the fish!',
          },
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 42 - #button.desc)
        button.key_format = "  %s"
      end

      return opts
    end
  },
}
