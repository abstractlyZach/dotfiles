command: "date +\"%a %Y-%m-%d\""

refreshFrequency: 10000

render: (output) ->
  """
  <div class="cal"
    <span></span>
    <span class="icon fa fa-calendar"></span>
  </div>
  """

update: (output, el) ->
  $(".cal span:first-child", el).text("  #{output}")

style: """
  top: 6px
  right: 100px 
"""
