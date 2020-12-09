local hyper = {"cmd", "alt", "ctrl"}

hs.hotkey.bind(hyper, "E", function()
    hs.application.launchOrFocus("/Applications/Emacs.app")
end)

hs.hotkey.bind(hyper, "Q", function()
    hs.application.launchOrFocus("/Applications/qutebrowser.app")
end)

hs.hotkey.bind(hyper, "Return", function()
    hs.application.launchOrFocus("/Applications/Alacritty.app")
end)

hs.hotkey.bind(hyper, "C", function()
    hs.application.launchOrFocus("/Applications/Google Chrome.app")
end)

hs.hotkey.bind(hyper, "D", function()
    hs.application.launchOrFocus("/Applications/DingTalk.app")
end)

hs.hotkey.bind(hyper, "F", function()
    hs.application.launchOrFocus("/Applications/Firefox.app")
end)

hs.hotkey.bind(hyper, "V", function()
    hs.application.launchOrFocus("/System/Applications/Preview.app")
end)

hs.hotkey.bind(hyper, "W", function()
    hs.application.launchOrFocus("/Applications/WeChat.app")
end)
