$ ->
  hideRatings = ->
    $('#top_ratings #ratings').hide()
    $('#top_ratings #maximize').show()
    $('#top_ratings #minimize').hide()
  showRatings = ->
    $('#top_ratings #ratings').show()
    $('#top_ratings #maximize').hide()
    $('#top_ratings #minimize').show()

  $('body').on 'click', '#maximize, #minimize', (e) ->
    e.preventDefault()
    if $('#ratings:visible').length then hideRatings() else showRatings()

  location = window.location.pathname
  $('#maximize').click() if location == '/' or location == '/en'
  
  $("#index_expert-block ul li p.get-text").each ->
    niceText = $(this)
    openSpan = "<b>"
    closeSpan = "</b>"
    niceText = niceText.text().split(" ")
    niceText.unshift openSpan
    niceText.splice 3, 0, closeSpan
    niceText = niceText.join(" ")
    $(this).html niceText
  
  $("#partners-slider").jcarousel(
    vertical: true
    wrap: "circular"
  )
  $("#partners-slider_prev").click ->
    $("#partners-slider").jcarousel "scroll", "-=1"
    false
  $("#partners-slider_next").click ->
    $("#partners-slider").jcarousel "scroll", "-=1"
    false