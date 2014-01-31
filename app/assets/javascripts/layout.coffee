$ ->
  hideRatings = ->
    $('#get-rating_block #ratings').hide()
    $('#get-rating_block #maximize').show()
    $('#get-rating_block #minimize').hide()
  showRatings = ->
    $('#get-rating_block #ratings').show()
    $('#get-rating_block #maximize').hide()
    $('#get-rating_block #minimize').show()
  hidePotential = ->
    $('#get-potential_block #potential').hide()
    $('#get-potential_block #maximize').show()
    $('#get-potential_block #minimize').hide()
  showPotential = ->
    $('#get-potential_block #potential').show()
    $('#get-potential_block #maximize').hide()
    $('#get-potential_block #minimize').show()

  $('body #get-rating_block').on 'click', '#maximize, #minimize', (e) ->
    e.preventDefault()
    if $('#ratings:visible').length then hideRatings() else showRatings()

  $('body #get-potential_block').on 'click', '#maximize, #minimize', (e) ->
    e.preventDefault()
    if $('#potential:visible').length then hidePotential() else showPotential()

  $("#partners-slider").jcarousel(
    vertical: true
    wrap: "circular"
  )

  $("#nominees-slider").jcarousel(
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

  $("#nominees-slider_prev").click ->
    $("#nominees-slider").jcarousel "scroll", "-=1"
    false
  $("#nominees-slider_next").click ->
    $("#nominees-slider").jcarousel "scroll", "-=1"
    false

  unless gon.locale == 'ru'
    $.datepicker.setDefaults $.datepicker.regional['en-GB']

  $( "#dp-inline" ).datepicker(
    showOtherMonths: true
    selectOtherMonths: true
  )

  $('#videoModal').on 'hide', ->
    $(@).find("iframe").attr "src", $(@).find("iframe").attr("src")
  $('body').on 'click', '.video a', ->
    el = $(@).parents('figure')
    $('#videoModal #videoModalLabel').text el.data('title')
    $('#videoModal .iframe').html el.data('iframe')

  $('body').on 'click', '.disabled', (e) ->
    e.preventDefault()

  $('body').on 'change', '#category_select', ->
    category = $(@).find(':selected').text()
    if category == 'Все'
      $('article.expert').show()
    else
      $("article.expert[data-category!='#{category}']").hide()
      $("article.expert[data-category='#{category}']").show()

  reverse = false
  $('body').on 'click', '.link-abc a', (e) ->
    e.preventDefault()
    reverse = if reverse then false else true
    list = $(".get-experts_category")
    items = $("article.expert").get()

    items.sort (a, b) ->
      compA = $(a).data('name')
      compB = $(b).data('name')
      return if (compA > compB) then -1 else
        if (compA < compB) then 1 else 0

    items.reverse() unless reverse
    list.html items

  menu_html = $('ul.press-centre').html()
  content_html = $("#press-centre").html()
  prev = if gon.locale=='ru' then 'Предыдущая' else 'Previous'
  next = if gon.locale=='ru' then 'Следующая' else 'Next'
  config =
    containerID : "press-centre"
    perPage : 3
    previous: prev
    next: next

  $('.get-pager.press-centre').jPages(config)

  $('body').on 'click', 'ul.press-centre a', (e) ->
    e.preventDefault()
    category = $(@).text()
    name = $(@).parent().attr('class')

    $('ul.press-centre').html menu_html
    $("ul.press-centre .#{name}").html category
    $("#press-centre").html content_html
    $("article.press-centre[data-category!='#{category}']").remove()
    $(".get-pager.press-centre").jPages("destroy").jPages(config)
