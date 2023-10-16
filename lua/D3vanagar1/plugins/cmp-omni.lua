require'cmp'.setup {
  sources = {
    {
      name = 'omni',
      option = {
        disable_omnifuncs = { 'v:lua.vim.lsp.omnifunc' }
      }
    }
  }
}
