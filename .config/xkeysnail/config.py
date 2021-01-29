# -*- coding: utf-8 -*-

import re
import subprocess
from xkeysnail.transform import *

# define timeout for multipurpose_modmap
define_timeout(1)

# [Global modemap] Change modifier keys as in xmodmap
define_conditional_modmap(lambda wm_class, device_name: device_name.startswith("USB Keyboard"), {
    Key.LEFT_ALT: Key.LEFT_META,
    Key.LEFT_META: Key.LEFT_ALT
})

define_conditional_multipurpose_modmap(re.compile(r'Emacs'), {
    Key.ENTER: [Key.ENTER, Key.RIGHT_CTRL],
    Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL],
    Key.LEFT_SHIFT: [Key.F13, Key.LEFT_SHIFT]
})

# [Multipurpose modmap] Give a key two meanings. A normal key when pressed and
# released, and a modifier key when held down with another key. See Xcape,
# Carabiner and caps2esc for ideas and concept.
define_conditional_multipurpose_modmap(lambda wm_class, device_name: device_name.startswith("USB Keyboard"), {
    # Enter is enter when pressed and released. Control when held down.
    Key.ENTER: [Key.ENTER, Key.RIGHT_CTRL],
    # Capslock is escape when pressed and released. Control when held down.
    Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL]
})

# Keybindings for wmctrl
define_keymap(None, {
    K("RSuper-enter"): K("LSuper-LM-LC-enter"),
    K("RSuper-e"): K("LSuper-LM-LC-e"),
    K("RSuper-f"): K("LSuper-LM-LC-f"),
    K("RSuper-q"): K("LSuper-LM-LC-q")
})

define_keymap(re.compile("st|Alacritty"), {
    K("LSuper-c"): K("LShift-LC-c"),
    K("LSuper-v"): K("LShift-LC-v")
})

subprocess.check_call(['xset', 'r', 'rate', '200', '60'])
