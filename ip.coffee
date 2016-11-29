command: "ifconfig en5 | grep 'inet ' | cut -d ' ' -f 2"

refreshFrequency: 300000 # ms

render: (output) ->
  "ip <span>#{output}</span>"

style: """
  -webkit-font-smoothing: antialiased
  color: #D5C4A1
  font: 12px Hack
  right: 305px
  top: 6px
  span
    color: #7AAB7E
"""
