setSizes = ->
  windowHeight = $(window).height()
  $("#content").height(windowHeight - 100)
  0

$(window).resize -> setSizes()
jQuery ($) ->
  setSizes()
  $(".title").first().addClass("ui-corner-top")
  $(".table").first().addClass("ui-corner-top")
  $(".table th").each -> $(this).addClass("ui-state-hover")
  $(".table th").first().addClass("ui-corner-tl")
  $(".table th").last().addClass("ui-corner-tr")
  $(".table td").each -> $(this).addClass("ui-widget-content")
  $("input:submit, button").button();
  $("a[class='button']").button();
