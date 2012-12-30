values = []
found = false

drawRatingChart = ->
  data = new google.visualization.DataTable()
  data.addColumn 'date', 'Дата'
  $.each gon.regions, (key, value) ->
    data.addColumn 'number', value

  addRows data

  title = if gon.locale == 'en' then "RATING «FEDERAL BRAND»" else "РЕЙТИНГ «ФЕДЕРАЛЬНЫЙ БРЕНД»"
  options = 
    title: title
    pointSize: 5
    vAxis: {viewWindow: {min: 0, max: 850}}
    hAxis:
      format: "MMM yyy"
      viewWindowMode: 'explicit'
      viewWindow: {max: new Date(2013, 5, 11)}
    chartArea:
      left: 50

  chart = new google.visualization.LineChart(document.getElementById("rating_chart"))
  google.visualization.events.addListener chart, "ready", (event) ->
    replaceMonths()
  
  chart.draw data, options

addRows = (data) ->
  $.each gon.ratings, (key, value) ->
    values = []
    $.each value, (key, value) ->
      date = $.datepicker.parseDate "dd.mm.yy", key
      $.datepicker.setDefaults($.datepicker.regional['en-GB']) unless gon.locale == 'ru'
      values.push { "v": date, "f": $.datepicker.formatDate('MM yy', date) }
      addValues value, data
        
    data.addRow values

addValues = (value) ->
  regions(region, value) for region in gon.regions

regions = (region, supplied) ->
  found = false
  checkRegion(info, region, supplied) for info in supplied when found is false

checkRegion = (info, region, supplied) ->
  if info[0] == region then sumValues(info[1]) else missing(info, supplied)

missing = (info, supplied) ->
  values.push(0) if $.inArray(info, supplied)+1 == supplied.length

sumValues = (data) ->
  sum = 0
  found = true
  sum += num.value for num in data
  values.push sum
 
setGraphSize = ->
  # $('#rating_chart').width($('#container').width())

loadChart = ->
  google.load "visualization", "1",
    packages: ["corechart"]
    language: gon.locale
    callback: drawRatingChart

monthNamesTarget = ['янв.','февр.','марта','апр.','мая','июня',
    'июля','авг.','сент.','окт.','нояб.','дек.']

monthNamesShort = ['Янв','Фев','Мар','Апр','Май','Июн','Июл','Авг',
    'Сен','Окт','Ноя','Дек']

replaceMonths = ->
  $.each monthNamesTarget, (key, value) ->
    $("#rating_chart text[text-anchor='middle']:contains(#{value})").text(
      monthNamesShort[key]
    )

$ ->
  return unless $('#rating_chart').length

  loadChart()

  $(window).bind "resize", (e) ->
    setGraphSize()
    loadChart()