$ ->
  hideRatings = ->
    $('#get-rating_block #ratings').hide()
    $('#get-rating_block #maximize').show()
    $('#get-rating_block #minimize').hide()
  showRatings = ->
    $('#get-rating_block #ratings').show()
    $('#get-rating_block #maximize').hide()
    $('#get-rating_block #minimize').show()

  $('body').on 'click', '#maximize, #minimize', (e) ->
    e.preventDefault()
    if $('#ratings:visible').length then hideRatings() else showRatings()

  path_menu = window.location.pathname
  $('#get-nav nav a[href$="' + path_menu + '"]').addClass 'active'

  $("#partners-slider").jcarousel(
    vertical: true
    wrap: "circular"
  )

  if $("#partners-slider").length < 6
    $("#partners-slider_prev, #partners-slider_next").hide()

  $("#partners-slider_prev").click ->
    $("#partners-slider").jcarousel "scroll", "-=1"
    false
  $("#partners-slider_next").click ->
    $("#partners-slider").jcarousel "scroll", "-=1"
    false
