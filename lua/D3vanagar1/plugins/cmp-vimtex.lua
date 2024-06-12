return {
  'micangl/cmp-vimtex',
  config = function()
    -- VimTeX configuration goes here, e.g.
    require('cmp_vimtex').setup {
      additional_information = {
        match_against_info = true,
        info_max_length = 60,
        info_in_menu = true,
        symbols_in_menu = true,
      },
      bibtex_parser = {
        enabled = true,
      },
      search = {
        browser = 'xdg-open',
        default = 'arxiv',
        search_engines = {
          name = 'Arxiv',
          get_url = require('cmp_vimtex').url_default_format 'https://arxiv.org/search/?query=%s&searchtype=all&source=header',
        },
      },
    }
  end,
}
