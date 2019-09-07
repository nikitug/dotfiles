#!/usr/bin/osascript

on run name
  tell application "Telegram Desktop" to activate
  if name is not {} then
    delay 0.1
    tell application "System Events" to tell process "Telegram Desktop"
      keystroke "k" using command down
      delay 0.5
      keystroke name
      delay 0.5
      keystroke return
    end tell
  end if
end run
