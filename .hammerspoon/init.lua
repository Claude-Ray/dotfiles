-- luacheck: ignore hs

-- modifiers
local hyper = {"cmd", "alt", "ctrl"}

---------------------------------------------------------------------------------
-- Window Manager
-- { hotkey: name }
local appTable = {
  Return = "Alacritty",
  C = "Google Chrome",
  D = "DingTalk",
  E = "/Applications/Emacs.app",
  F = "Firefox",
  Q = "qutebrowser",
  M = "NeteaseMusic",
  V = "Preview",
  W = "WeChat",
  X = "企业微信",
}

-- { hotkey: { bundleID: title } }
local winTable = {
  -- Example for launchOrFocusWindow
  ['1'] = { "com.microsoft.VSCode", "bff%-node" },
}

--- launchOrFocus an application
-- @param name app
local function launchOrFocusApp(name)
  return function()
    hs.application.launchOrFocus(name)
  end
end

--- launchOrFocus a specific window from all windows of one application
-- @param bundleID bundle identifier of the app
-- @param winTitle partial window title (characters .()[]+- should be escaped with %)
local function launchOrFocusWindow(bundleID, winTitle)
  return function()
    local app = hs.application(bundleID)
    if app == nil then
      hs.application.open(bundleID)
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

local function bindHotkey(t)
  for k, v in pairs(t) do
    hs.hotkey.bind(hyper, k, launchOrFocusApp(v))
  end
end

local function bindWindowHotkey(t)
  for k, v in pairs(t) do
    hs.hotkey.bind(hyper, k, launchOrFocusWindow(v[1], v[2]))
  end
end

-- Bind hotkeys
bindHotkey(appTable)
bindWindowHotkey(winTable)

---------------------------------------------------------------------------------
-- Kechain
-- luacheck: ignore spoon
hs.loadSpoon("Keychain")

--- input a preset text (or weak pass) from Keychain
-- @param account
local function inputKeychain(account)
  return function()
    local item = spoon.Keychain:getItem{service="org.hammerspoon.Hammerspoon", account}
    if item ~= nil then
      hs.eventtap.keyStrokes(item.password)
    end
  end
end

hs.hotkey.bind(hyper, "tab", inputKeychain("puppet"))
