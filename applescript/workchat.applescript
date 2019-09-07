#!/usr/bin/osascript

on run name
  tell application "Workplace Chat" to activate
  if name is not {} then
    delay 0.1
    tell application "System Events" to tell process "Workplace Chat"
      keystroke "k" using command down
      delay 0.1
      keystroke name
      delay 0.75
      keystroke return
      delay 0.1
      key code 53 # escape
    end tell
  end if
end run
