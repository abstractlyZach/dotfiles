# Get the current window and display it in the middle of the status bar

command: '/usr/local/bin/yabai -m query --windows --window mouse 2>/dev/null | /usr/local/bin/jq ".app" | tr -d \'"\''

refreshFrequency: 500

render: (output) ->
  """
  <div class="current_window">
  </div>
  """

update: (output, el) ->
  $(".current_window", el).text("  #{output}")

style: """
  top: 7px;
  width: 100%;
  text-align: center;
  font-weight: bold;
"""
