#!/usr/bin/osascript

on run name
  tell application "WhatsApp" to activate
  if name is not {} then
    delay 0.1
    tell application "System Events" to tell process "WhatsApp"
      keystroke "f" using command down
      delay 0.2
      keystroke name
      delay 0.2
      keystroke return
    end tell
  end if
end run
