$(document).ready ->
  $(".print").click ->
    parent = $(this).parent()

    # render print stylesheet
    _printFunction = window.print

    window.print = ->
      alert "printing"
      parent.siblings().hide()
      _printFunction()
      parent.siblings().show()

    window.print()
