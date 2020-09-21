# Invocation depends on distros.
# 1. login shell
# `/etc/profile` first at all, then `~/.bash_profile`, `~/.bash_login`, and `~/.profile`, in that order, and read the first one that exists and is readable.
# When a login shell exits, `~/.bash_logout`, if it exists.

# 2. non-login shell
# `~/.bashrc`

# 3. bash by sh
# `/etc/profile`, `~/.profile`

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
