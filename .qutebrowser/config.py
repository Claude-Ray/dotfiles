import os
os.environ['PATH'] = os.pathsep + '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin'

# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

# Autogenerated config.py
#
# NOTE: config.py is intended for advanced users who are comfortable
# with manually migrating the config file on qutebrowser upgrades. If
# you prefer, you can also configure qutebrowser using the
# :set/:bind/:config-* commands without having to write a config.py
# file.
#
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Require a confirmation before quitting the application.
# Type: ConfirmQuit
# Valid values:
#   - always: Always show a confirmation.
#   - multiple-tabs: Show a confirmation if multiple tabs are opened.
#   - downloads: Show a confirmation if downloads are running
#   - never: Never show a confirmation.
c.confirm_quit = ['multiple-tabs', 'downloads']

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.notifications = True

# Allow pdf.js to view PDF files in the browser. Note that the files can
# still be downloaded by clicking the download button in the pdf.js
# viewer.
# Type: Bool
c.content.pdfjs = True

# Proxy to use. In addition to the listed values, you can use a
# `socks://...` or `http://...` URL. Note that with QtWebEngine, it will
# take a couple of seconds until the change is applied, if this value is
# changed at runtime.
# Type: Proxy
# Valid values:
#   - system: Use the system wide proxy.
#   - none: Don't use any proxy
c.content.proxy = 'http://localhost:7890/'

# Allow websites to register protocol handlers via
# `navigator.registerProtocolHandler`.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.register_protocol_handler', True, 'https://mail.google.com?extsrc=mailto&url=%25s')

# Comma-separated list of regular expressions to use for 'next' links.
# Type: List of Regex
c.hints.next_regexes = [
    '\\bnext\\b',
    '\\bmore\\b',
    '\\bnewer\\b',
    '\\b[>→≫]\\b',
    '\\b(>>|»)\\b',
    '\\bcontinue\\b',
    '\\b下一?页\\b'
]

# Comma-separated list of regular expressions to use for 'prev' links.
# Type: List of Regex
c.hints.prev_regexes = [
    '\\bprev(ious)?\\b',
    '\\bback\\b',
    '\\bolder\\b',
    '\\b[<←≪]\\b',
    '\\b(<<|«)\\b',
    '\\b上一?页\\b'
]

# Format to use for the tab title. The following placeholders are
# defined:  * `{perc}`: Percentage as a string like `[10%]`. *
# `{perc_raw}`: Raw percentage, e.g. `10`. * `{current_title}`: Title of
# the current web page. * `{title_sep}`: The string `" - "` if a title
# is set, empty otherwise. * `{index}`: Index of this tab. *
# `{aligned_index}`: Index of this tab padded with spaces to have the
# same   width. * `{id}`: Internal tab ID of this tab. * `{scroll_pos}`:
# Page scroll position. * `{host}`: Host of the current web page. *
# `{backend}`: Either `webkit` or `webengine` * `{private}`: Indicates
# when private mode is enabled. * `{current_url}`: URL of the current
# web page. * `{protocol}`: Protocol (http/https/...) of the current web
# page. * `{audio}`: Indicator for audio/mute status.
# Type: FormatString
c.tabs.title.format = '{audio}{index}: {perc}{current_title}'

# Search engines which can be used via the address bar.  Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` braces.  The following further
# placeholds are defined to configure how special characters in the
# search terms are replaced by safe characters (called 'quoting'):  *
# `{}` and `{semiquoted}` quote everything except slashes; this is the
# most   sensible choice for almost all search engines (for the search
# term   `slash/and&amp` this placeholder expands to `slash/and%26amp`).
# * `{quoted}` quotes all characters (for `slash/and&amp` this
# placeholder   expands to `slash%2Fand%26amp`). * `{unquoted}` quotes
# nothing (for `slash/and&amp` this placeholder   expands to
# `slash/and&amp`).  The search engine named `DEFAULT` is used when
# `url.auto_search` is turned on and something else than a URL was
# entered to be opened. Other search engines can be used by prepending
# the search engine name to the search term, e.g. `:open google
# qutebrowser`.
# Type: Dict
c.url.searchengines = {
    'DEFAULT': 'https://google.com/search?q={}',
    'google': 'https://google.com/search?q={}',
    'duckduckgo': 'https://duckduckgo.com/?q={}',
    'github': 'https://github.com/search?q={}',
    'npmjs': 'https://npmjs.com/search?q={}',
    'reddit': 'https://www.reddit.com/search/?q={}',
    'baidu': 'https://baidu.com/s?wd={}',
    'douban': 'https://douban.com/search?q={}',
    'emacs-china': 'https://emacs-china.org/search?q={}',
    'zhihu': 'https://zhihu.com/search?q={}',
    'l': 'http://localhost:{}',
}

# Hide the window decoration.  This setting requires a restart on
# Wayland.
# Type: Bool
# NOTE: How to maximize window after setting hide_decoration to True in OSX?
# 1. :set window.hide_decoration false
# 2. :fullscreen
# 3. :set window.hide_decoration true
# 4. Enter the system Mission Control (press Ctrl+Up)，then drag the
#    qutebrowser window back from the "fullscreen" desktop
# 5. Click or scroll to anywhere with mouse/trackpad to active this window
# 6. Done
c.window.hide_decoration = True

# Bindings for normal mode
config.unbind('<Ctrl-w>')
config.unbind('<Ctrl-q>')
config.bind('x', 'tab-close')
config.bind('X', 'undo')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('d', 'scroll-page 0 0.5')
config.bind('u', 'scroll-page 0 -0.5')
config.bind('j', 'scroll-page 0 0.1')
config.bind('k', 'scroll-page 0 -0.1')
# config.bind('i', 'enter-mode insert ;; spawn fcitx-remote -t')
# config.bind('gi', 'hint inputs --first ;; spawn fcitx-remote -t')
config.bind('p', 'open -- {clipboard}')
config.bind('P', 'open -t -- {clipboard}')
config.unbind('gl')
config.unbind('gr')
config.bind('gj', 'tab-move -')
config.bind('gk', 'tab-move +')
config.bind('<', 'tab-move -')
config.bind('>', 'tab-move +')
config.bind('m', 'enter-mode set_mark')
config.bind('`', 'enter-mode jump_mark')
config.unbind('M')
config.bind('MM', 'bookmark-add')
config.bind('MD', 'bookmark-del')
config.bind('Mb', 'quickmark-save')
config.bind('<Alt-x>', 'set-cmd-text :')
config.bind('<Ctrl-h>', 'set-cmd-text :help :')
config.bind('<Ctrl-i>', 'tab-focus stack-next')
config.bind('<Ctrl-o>', 'tab-focus stack-prev')
config.bind('<Escape>', c.bindings.default['normal']['<Escape>'] + ' ;; fake-key <Escape> ;; clear-messages ;; jseval --quiet document.getSelection().empty()')
config.bind('<Meta-Ctrl-f>', 'config-cycle window.hide_decoration false true')
config.bind('t,p', 'config-cycle content.proxy system http://localhost:7890/')

# Bindings for insert mode
config.bind('<Ctrl-a>', 'fake-key <Home>', mode='insert')
config.bind('<Ctrl-e>', 'fake-key <End>', mode='insert')
config.bind('<Ctrl-d>', 'fake-key <Delete>', mode='insert')
config.bind('<Ctrl-h>', 'fake-key <Backspace>', mode='insert')
config.bind('<Ctrl-k>', 'fake-key <Shift-End> ;; fake-key <Delete>', mode='insert')
config.bind('<Ctrl-u>', 'fake-key <Shift+Home> ;; fake-key <BackSpace>', mode='insert')
config.bind('<Ctrl-f>', 'fake-key <Right>', mode='insert')
config.bind('<Ctrl-b>', 'fake-key <Left>', mode='insert')
config.bind('<Ctrl-n>', 'fake-key <Down>', mode='insert')
config.bind('<Ctrl-p>', 'fake-key <Up>', mode='insert')
# config.bind('<Escape>', 'spawn fcitx-remote -t ;; leave-mode ;; fake-key <Escape>', mode='insert')
config.bind('<Escape>', 'leave-mode ;; fake-key <Escape>', mode='insert')
# config.bind('<Ctrl-[>', 'spawn fcitx-remote -t ;; leave-mode', mode='insert')
config.bind('<Ctrl-[>', 'leave-mode', mode='insert')

# Bindings for shortcut
# Leader key: `,`
config.bind(',b', 'open -t http://localhost:5000') # Beancount
config.bind(',e', 'open -t https://emacs-china.org')
config.bind(',f', 'open -t https://feedly.com')
config.bind(',g', 'open -t https://github.com')
config.bind(',h', 'open -t https://news.ycombinator.com')
config.bind(',l', 'open -t https://leetcode.com/problemset/all')
config.bind(',m', 'open -t https://mail.google.com')
config.bind(',r', 'open -t https://reddit.com')
config.bind(',v', 'open -t https://v2ex.com')
config.bind(',z', 'open -t https://zhihu.com')

# Bindings for cmd-text
# Leader key: `s`
config.unbind('sf')
config.unbind('sk')
config.unbind('sl')
config.unbind('ss')
config.bind('sf', 'set-cmd-text -s :open -t file:// ')
config.bind('sl', 'set-cmd-text -s :open -t localhost ')
config.bind('sq', 'set-cmd-text -s :open -t docs.qq.com ')
config.bind('sy', 'set-cmd-text -s :open -t yuque.com ')

# Bindings for cmd
# Leader key: `\`
config.bind('\\d', 'help')
config.bind('\\h', 'history')
config.bind('\\m', 'messages')
config.bind('\\r', 'config-source')
config.bind('\\u', 'adblock-update')
config.bind('\\v', 'version')
