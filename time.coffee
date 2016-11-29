command: "date +\"%H:%M:%S %s\""

refreshFrequency: 1000 # ms

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #458588
  font: 12px Hack
  right: 10px
  top: 6px
"""
