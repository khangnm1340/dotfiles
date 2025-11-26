-- vim.opt_local.textwidth = 80

function _G.markdown_foldexpr()
  local line = vim.fn.getline(vim.v.lnum)
  local heading_level = line:match("^(#+)%s")
  if heading_level then
    return ">" .. #heading_level
  else
    return "="
  end
end

local function set_markdown_folding()
  vim.opt_local.foldmethod = "expr"
  vim.opt_local.foldexpr = "v:lua.markdown_foldexpr()"
  vim.opt_local.foldlevel = 99
end

set_markdown_folding()
