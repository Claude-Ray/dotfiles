local hyper = {"cmd", "alt", "ctrl"}

hs.hotkey.bind(hyper, "E", function()
    hs.application.launchOrFocus("/Applications/Emacs.app")
end)

hs.hotkey.bind(hyper, "Q", function()
    hs.application.launchOrFocus("/Applications/qutebrowser.app")
end)

hs.hotkey.bind(hyper, "T", function()
    hs.application.launchOrFocus("/Applications/iTerm.app")
end)

hs.hotkey.bind(hyper, "Return", function()
    hs.application.launchOrFocus("/Applications/iTerm.app")
end)
