hs.hotkey.bind({"cmd", "ctrl"}, "E", function()
    hs.application.launchOrFocus("/Applications/Emacs.app")
end)

hs.hotkey.bind({"cmd", "ctrl"}, "Q", function()
    hs.application.launchOrFocus("/Applications/qutebrowser.app")
end)

hs.hotkey.bind({"cmd", "ctrl"}, "I", function()
    hs.application.launchOrFocus("/Applications/iTerm.app")
end)
