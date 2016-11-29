command: "osascript -e 'tell application \"Firefox\" to return name of window 3' | cut -d '-' -f 1,2"

refreshFrequency: 5000 # ms

render: (output) ->
  "music <span>#{output}</span>"

style: """
  -webkit-font-smoothing: antialiased
  color: #D5C4A1
  font: 12px Hack
  right: 400px
  top: 6px
  span
    color: #7AAB7E
"""
