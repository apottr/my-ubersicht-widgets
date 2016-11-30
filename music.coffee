command: "osascript -e 'tell application \"Firefox\"' -e 'set window_list to every window' -e 'repeat with the_window in window_list' -e 'set windowName to name of the_window' -e 'if windowName contains \"Google Play Music\" then' -e 'return windowName' -e 'end if' -e 'end repeat' -e 'end tell' | cut -d '-' -f 1,2"

refreshFrequency: 5000 # ms

render: (output) ->
  artist = output.split('-')[1].trim()
  song = output.split('-')[0].trim()
  out = if artist != "Google Play Music" then "music \"<span class='data'>#{song}</span>\" by <span class='data'>#{artist}</span>" else "album <span class='data'>#{song}</span>"
  "#{out}"
style: """
  -webkit-font-smoothing: antialiased
  color: #D5C4A1
  font: 12px Hack
  right: 400px
  top: 6px
  .data
    color: #7AAB7E
  .byline
    color: #D5C4A1
"""
