#!/usr/bin/osascript

on run details
  tell application "System Events"
    set lastApp to bundle identifier of 1st process whose frontmost is true
    display dialog details with title "Terminal Notification" buttons "OK" default button "OK" with icon file ":System:Library:CoreServices:CoreTypes.bundle:Contents:Resources:Actions.icns"
  end tell
  activate application id lastApp
end run
