return {
  "willothy/nvim-cokeline",
  dependencies = {
    "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
    "kyazdani42/nvim-web-devicons", -- If you want devicons
    "stevearc/resession.nvim"       -- Optional, for persistent history
  },
  config = function()
    local get_hex = require('cokeline.hlgroups').get_hl_attr
    require("cokeline").setup({
      default_hl = {
        bg = function(buffer)
          if buffer.is_focused then
            if buffer.diagnostics.errors ~= 0 then
              return get_hex('DiagnosticError', 'fg')
            end
            if buffer.diagnostics.warnings ~= 0 then
              return get_hex('DiagnosticWarn', 'fg')
            end
            return get_hex("Normal", "fg")
          end
          return "NONE"
        end,
        fg = function(buffer)
          return
              buffer.is_focused
              and get_hex("Normal", "bg")
              or get_hex("Comment", "fg")
        end,
      },

      components = {
        {
          text = '  ',
        },
        {
          text = function(buffer) return buffer.unique_prefix end,
          italic = true
        },
        {
          text = function(buffer) return buffer.filename .. '    ' end,
          fg = nil,
          bold = function(buffer)
            return buffer.is_focused
          end,
          underline = function(buffer)
            return buffer.is_hovered and not buffer.is_focused
          end
        },
        {
          text = function(buffer) return buffer.is_modified and '●' or '✕' end,
          fg = function(buffer)
            if buffer.is_focused then
              return nil
            end
            if buffer.is_modified then
              return get_hex("CmpItemMenu", "fg")
            end
            return get_hex('DiagnosticError', 'fg')
          end,
          on_click = function(_, _, _, _, buffer)
            buffer:delete()
          end
        },
        {
          text = '  ',
        }
      },
      sidebar = {
        filetype = { "NvimTree" },
        components = {
          {
            text = function(buf)
              return "Files"
            end,
            fg = get_hex("PmenuSel", "bg"),
            bg = get_hex("Normal", "bg"),
          }
        }
      }
    })
  end
}
