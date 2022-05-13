local util = require 'lspconfig.util'
local root_pattern = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git", "CMakeLists.txt", "src");

return {
  cmd = { 'clangd', '--clang-tidy',  '--log=error', '--background-index', '--fallback-style=mozilla', '--malloc-trim', '--all-scopes-completion', '--ranking-model=decision_forest' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  single_file_support = true,
  root_dir = function(fname)
    local filename = util.path.is_absolute(fname) and fname or util.path.join(vim.loop.cwd(), fname)
    return root_pattern(filename)
  end,
}
