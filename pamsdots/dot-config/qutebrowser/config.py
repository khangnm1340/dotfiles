config.load_autoconfig(False)

import catppuccin

catppuccin.setup(c, 'mocha', True)

# import gruvbox_light_theme
# gruvbox_light_theme.apply_gruvbox_light_theme(c)

c.bindings.key_mappings = {'<Alt-j>': '<Return>'}

c.fonts.default_size = '15pt'
c.editor.command = ['neovide', '--', '{file}', '-c', 'normal {line}G{column0}l']

c.tabs.position = 'right'
c.tabs.width = '20%'

c.url.default_page = 'about:blank'

c.url.searchengines = {
    'DEFAULT': 'https://www.google.com/search?q={}',
    'yt': 'https://www.youtube.com/results?search_query={}',
}

c.content.autoplay = False


c.session.default_name = "temp"
c.auto_save.session = True
# c.session.lazy_restore = True

# c.url.start_pages = ['~/dotfiles/pamsdots/dot-config/qutebrowser/sessions/hanni.html']
c.url.start_pages = ['qute://history/']


c.content.user_stylesheets = ["~/dotfiles/pamsdots/dot-config/qutebrowser/styles/yt-tweaks.css"]
c.hints.chars = 'qweruioasdfjklh'

c.zoom.default = '125%'

config.set('content.javascript.clipboard', 'access', 'https://github.com/**')
config.set('content.javascript.clipboard', 'access', 'https://gemini.google.com/**')

c.content.javascript.log_message.excludes = {
    "userscript:_qute_stylesheet": ["*Refused to apply inline style because it violates the following Content Security Policy directive: *"],
    # Combine the patterns for "userscript:_qute_js" into a single list
    "userscript:_qute_js": [
        "*TrustedHTML*",
        "*Uncaught TypeError: Cannot read properties of undefined (reading 'length')*",
        "*Uncaught TypeError: node.getDestinationInsertionPoints is not a function*"
    ]
}

c.colors.webpage.darkmode.enabled = True
config.set('colors.webpage.darkmode.enabled', False, '*://127.0.0.1/*')


config.bind('ck','config-cycle colors.webpage.darkmode.enabled true false ;; reload')
# config.set("colors.webpage.preferred_color_scheme", "light", "127.0.0.1")



config.bind('<Ctrl-R>', ':config-source ;; message-info "Config reloaded!"')
config.unbind('<Ctrl-V>', mode='normal') # Or other mode
config.bind('a', 'hint')
config.bind('t', 'cmd-set-text -s :open -t')
config.bind('<Ctrl-Shift-P>', 'open -t')
config.bind('x', 'tab-close')
config.bind('X', 'undo')
config.bind('d', 'scroll-page 0 0.5')
config.bind('u', 'scroll-page 0 -0.5')
config.bind('h', 'back')
config.bind('l', 'forward')

config.bind('b', 'cmd-set-text -s :bookmark-load -t')
config.bind('B', 'bookmark-add')

config.bind('m', 'mode-enter set_mark')
# config.bind('m', 'cmd-set-text -s :set-mark')

config.bind('<Ctrl-Shift-V>', 'mode-enter passthrough')

config.bind('p', 'open -t -- {clipboard}')
config.bind('<Ctrl-Shift-p>', 'cmd-set-text -s :open -p')

config.bind('<Ctrl-L>', 'cmd-set-text :open -t -r {url:pretty}')
config.bind('cj', 'config-cycle statusbar.show always never')

config.bind('yf', 'hint links yank')
config.bind('p', 'open -t -- {clipboard}')

config.bind('e', 'fake-key f')
config.bind('E', 'fake-key t')

config.bind('gl', 'tab-clone')

config.bind('<Super-1>', 'tab-focus 1')
config.bind('<Super-2>', 'tab-focus 2')
config.bind('<Super-3>', 'tab-focus 3')
config.bind('<Super-4>', 'tab-focus 4')
config.bind('<Super-5>', 'tab-focus 5')

config.bind('<Ctrl-V>', 'cmd-set-text -s :tab-move')
config.bind('sl', 'cmd-set-text -s :spawn --userscript tab-manager.py /home/pampam/dotfiles/pamsdots/dot-config/qutebrowser/sessions/' )
config.bind('ss', 'session-save temp' )
config.bind('sd', 'session-load temp' )
# config.bind('SS', 'cmd-set-text -s :session-save' )
# config.bind('SD', 'cmd-set-text -s :session-load' )
config.bind('<Ctrl-h>', 'history -t')

config.bind('<Alt-J>', 'tab-move +')
config.bind('<Alt-K>', 'tab-move -')

c.bindings.key_mappings = {'<Ctrl-[>': '<Escape>', '<Ctrl-6>': '<Ctrl-^>', '<Ctrl-M>': '<Return>', '<Ctrl-J>': '<Return>', '<Ctrl-I>': '<Tab>', '<Shift-Return>': '<Return>', '<Enter>': '<Return>', '<Shift-Enter>': '<Return>', '<Ctrl-Enter>': '<Ctrl-Return>'}

config.bind('<Ctrl-Alt-C>', 'config-cycle tabs.show always never')

