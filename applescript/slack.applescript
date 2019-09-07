#!/usr/bin/osascript

on run name
  tell application "Slack" to activate
  if name is not {} then
    delay 0.1
    tell application "System Events" to tell process "Slack"
      keystroke "k" using command down
      delay 0.2
      keystroke name
      delay 0.2
      keystroke return
    end tell
  end if
end run
