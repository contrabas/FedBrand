values = []
found = false
startDate = new Date(2100, 0, 1)
endDate = null

monthNamesTarget = ['янв.','февр.','марта','апр.','мая','июня',
    'июля','авг.','сент.','окт.','нояб.','дек.']

monthNamesShort = ['Янв','Фев','Мар','Апр','Май','Июн','Июл','Авг',
    'Сен','Окт','Ноя','Дек']

drawRatingChart = ->
  data = new google.visualization.DataTable()

  title = if gon.locale == 'en' then "«FEDERAL BRAND» RATINGS" else "РЕЙТИНГ «ФЕДЕРАЛЬНЫЙ БРЕНД»"
  position = if gon.data.regions.length then 'right' else 'none'

  data.addColumn('date', 'Дата')
  data.addColumn('number', '') unless gon.data.regions.length
  data.addColumn('number', value) for value in gon.data.regions
  addRows data

  options =
    title: title
    pointSize: 5
    legend:
      position: "#{position}"
    vAxis:
      viewWindow: {min: 150, max: 750}
    hAxis:
      format: "MMM yyy"
      viewWindow: {max: maxDate()}
    chartArea:
      left: 50
      height: '75%'
      width: '72%'

  chart = new google.visualization.LineChart(document.getElementById("rating_chart"))
  google.visualization.events.addListener chart, "ready", (event) ->
    replaceMonths()

  chart.draw data, options
  pos = $('g:eq(1) text').last().offset()
  $('.clear-selection').css
    position: 'absolute'
    top: pos.top+40
    left: pos.left

loadChart = ->
  google.load "visualization", "1",
    packages: ["corechart"]
    language: gon.locale
    callback: drawRatingChart

addRows = (data) ->
  $.each gon.data.ratings, (i, value) ->
    values = []

    $.each value, (key, ratings) ->
      date = $.datepicker.parseDate "dd.mm.yy", key
      startDate = date if i == 0
      endDate = date if i == gon.data.ratings.length-1

      values.push { "v": date, "f": $.datepicker.formatDate('MM yy', date) }

      addValues ratings

    data.addRow values

addValues = (value) ->
  regions(region, value) for region in gon.data.regions

regions = (region, supplied) ->
  found = false
  checkRegion(info, region, supplied) for info in supplied when found is false

checkRegion = (info, region, supplied) ->
  if info[0] == region then addValue(info[1]) else missValue(info, supplied)

addValue = (value) ->
  values.push value
  found = true

missValue = (info, supplied) ->
  values.push(0) if $.inArray(info, supplied)+1 == supplied.length

replaceMonths = ->
  $.each monthNamesTarget, (key, value) ->
    $("text[text-anchor='middle']:contains(#{value})").text (i, text) ->
      return text.replace value, monthNamesShort[key]

maxDate = ->
  return unless endDate
  interval = Math.abs((endDate.getFullYear()*12 + endDate.getMonth()) -
    (startDate.getFullYear()*12 + startDate.getMonth())) + 1

  toAdd = 4 - interval if interval < 4
  toAdd = 1 if interval == 9
  return unless toAdd

  date = new Date endDate
  date.setMonth endDate.getMonth() + toAdd, 1

  return date

regionSelect = ->
  ids = []
  startDate = new Date(2100, 0, 1)
  endDate = null

  ids.push region.value for region in $('.region input:checked')
  prefix = if gon.locale == 'en' then "/en" else ""
  gon.watch 'data', url: "#{prefix}/ratings?ids=#{ids}", updateChart

updateChart = (data) ->
  gon.data = data
  loadChart()

$ ->
  return unless $('#rating_chart').length

  loadChart()

  $.each $('.region .name'), (key, value) ->
    if $.inArray($(value).text(), gon.data.regions) >= 0
      $(value).parent().find('input').attr 'checked', true
      $(value).parent().addClass 'get-gradient'

  $('body').on "click", '.region input', ->
    $(@).parent().parent().toggleClass 'get-gradient'
    regionSelect()

  $('body').on 'click', '.clear-selection', (e) ->
    e.preventDefault()
    $('.region input').attr 'checked', false
    $('.region tr').removeClass 'get-gradient'
    regionSelect()
