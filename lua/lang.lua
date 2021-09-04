local lsp_installer = require("nvim-lsp-installer")
local path = require("nvim-lsp-installer.path")
local lsp_server = require "nvim-lsp-installer.server"

lsp_installer.on_server_ready(function(server)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  local opts = {
    root_dir = vim.loop.cwd,
    capabilities = capabilities,
  }

  if server.name == 'sumneko_lua' then
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = {"vim"}
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
          }
        },
        telemetry = {
          enable = false
        }
      }
    }
  elseif server.name == 'gopls' then
    opts.settings = {
      gopls = {
        analyses = {
          unusedparams = true,
          unusedwrite = true,
        },
        staticcheck = true,
      },
    }
  elseif server.name == 'solargraph' then
    local root_dir = lsp_server.get_server_root_path("ruby")
    opts.cmd = { path.concat { root_dir, "solargraph"  }, "stdio" }
  end

  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)
