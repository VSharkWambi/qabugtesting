# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ($) ->
  $(".table tr").hover(
    ->
      $(this).children("td[class~='movie_name_cell']").addClass("ui-state-active")
      $(this).children("td[class~='theater_name_cell']").addClass("ui-state-active")
      $(this).children("td").addClass("hover_row")
    ->
      $(this).children("td[class~='movie_name_cell']").removeClass("ui-state-active")
      $(this).children("td[class~='theater_name_cell']").removeClass("ui-state-active")
      $(this).children("td").removeClass("hover_row")
  )
  $("#billingInfoDiv").hide()
  $("#billingInfoAnchor").button()
  0

