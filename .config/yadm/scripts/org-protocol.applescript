(*
1.
$ open -a Script\ Editor ~/.config/yadm/scripts/org-protocol.applescript
*)

on open location this_URL
    do shell script "/usr/local/bin/emacsclient \"" & this_URL & "\" && open -a Emacs"
end open location

(*
2.
# Export to "Application" File Format as "org-protocol.app"
*)

(*
3.
$ vim org-protocol.app/Contents/Info.plist

# Paste the following code in the <dict></dict>

<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLName</key>
    <string>org-protocol handler</string>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>org-protocol</string>
    </array>
  </dict>
</array>
*)
