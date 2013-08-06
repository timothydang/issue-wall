_printFunction = null
$(document).ready ->
  $(".print").click ->
    parent = $(this).parent()

    # render print stylesheet
    if _printFunction == null
      _printFunction = window.print

    window.print = ->
      parent.siblings().hide()
      _printFunction()
      parent.siblings().show()

    window.print()
