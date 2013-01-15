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