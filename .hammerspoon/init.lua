-- luacheck: ignore hs
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
    -- FIXME launch without "alt" key to avoid safe-mode
    hs.application.launchOrFocus("/Applications/Firefox.app")
end)

hs.hotkey.bind(hyper, "M", function()
    hs.application.launchOrFocus("/Applications/NeteaseMusic.app")
end)

hs.hotkey.bind(hyper, "V", function()
    hs.application.launchOrFocus("/System/Applications/Preview.app")
end)

hs.hotkey.bind(hyper, "W", function()
    hs.application.launchOrFocus("/Applications/WeChat.app")
end)

hs.hotkey.bind(hyper, "X", function()
    hs.application.launchOrFocus("/Applications/企业微信.app")
end)

--- launchOrFocus a specific window from all windows of one application
-- @param appTitle title in menu bar
-- @param appName full name or path
-- @param winTitle partial window title (characters .()[]+- should be escaped with %)
local function launchOrFocusWindow(appTitle, appName, winTitle)
  return function()
    local app = hs.application(appTitle)
    if app == nil then
      hs.application.open(appName)
    else
      local windows = app:allWindows()
      for _, win in pairs(windows) do
        local found = string.match(win:title(), winTitle)
        if found ~= nil then
          win:focus()
          return
        end
      end
      app:activate()
    end
  end
end

-- Example for launchOrFocusWindow
hs.hotkey.bind(hyper, "1", launchOrFocusWindow("Code", "Visual Studio Code", "bff%-node"))
