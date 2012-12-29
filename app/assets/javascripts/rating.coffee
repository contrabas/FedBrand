values = []
found = false

drawRatingChart = ->
  data = new google.visualization.DataTable()
  data.addColumn 'string', 'Дата'
  $.each gon.regions, (key, value) ->
    data.addColumn 'number', value

  addRows data

  options = 
    title: "Рейтинг"
    pointSize: 5
    vAxis: {viewWindow: {min: 0, max: 850}}
    chartArea: {width: "75%", height: "75%"}

  chart = new google.visualization.LineChart(document.getElementById("rating_chart"))
  chart.draw data, options

addRows = (data) ->
  $.each gon.ratings, (key, value) ->
    values = []
    $.each value, (key, value) ->
      values.push key
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
  $('#rating_chart').width($('#container').width())

loadChart = ->
  google.load "visualization", "1",
    packages: ["corechart"]
    callback: drawRatingChart

$ ->
  return unless $('#rating_chart')

  loadChart()

  $(window).bind "resize", (e) ->
    setGraphSize()
    loadChart()
  