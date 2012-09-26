window.BEE = {
  version: '3.0.0.alpha'
}

class Application
  constructor: ->
    experimentChannel = window.pusherChannel?= 'experiment-channel'
    @chamber = new TestChamber
    @pusherListener = new PusherListener(experimentChannel, this)

  pusherListener: -> @pusherListener

  chamber: -> @chamber

  # Public API for adding a serie. Receives the name of the serie and the
  # index of the array it points to.
  addSerie: (name, index) -> @chamber.addSerie(name, index)

  exportData: (select_all = true) ->
    chart = @chamber.chart
    baseSerie = chart.xAxis[0]
    extremes = baseSerie.getExtremes()
    indexes = @getIndexes(extremes)

    $('input#hdnMin').val(window.sampleData[indexes[0]][0])
    $('input#hdnMax').val(window.sampleData[indexes[1]][0])
    if select_all
      $('input#hdnSensors').val("")
    else
      $('input#hdnSensors').val(@getSelectedSensors(select_all))
    $('#btnDownload').click()


  getSelectedSensors: ->
    _.map ($ @chamber.seriesSelector), (checkbox, index) ->
      checkbox.value

  # Returns an array with the data [`from`, `to`] in the original array
  extractData: (from, to) -> window.sampleData[i] for i in [from..to]

  # Returns the indexes for the `extremes.max` and `extremes.min`
  # in the `window.sampleData` array (original array).
  #
  # This will be used to export the data that is being graphed instead
  # of all the data.
  getIndexes: (extremes) ->
    [
      @binarySearch(extremes.min),
      @binarySearch(extremes.max)
    ]

  binarySearch: (timestamp) ->
    low  = 0
    high = window.sampleData.length - 1
    while( high >= low )
      mid = Math.floor((low + high) / 2)
      time = Date.parse(window.sampleData[mid][1])
      if time > timestamp
        high = mid - 1
      else if time < timestamp
        low = mid + 1
      else
        return mid
    # Since the data can be average, get the previous  valid meassurement
    low - 1


window.TestChamber = class TestChamber
  seriesSelector: '.series-box:checked'

  constructor: ->
    @chart = 0
    @maxPoints = 60
    @series = []
    @chartInitialized = false

    if window.sampleData.length != 0
      @initializeChart()
      @memoSeries()


  # Adds the last row in the `window.sampleData` array to the series and draws
  # the chart again. Use this after a Pusher event has happened and we have a
  # new meassurement.
  addNewMeassurement: ->
    data = window.sampleData[window.sampleData.length - 1]
    _.each @chart.series, (serie, index) =>
      # console?.log(serie.name, "index on raw data => ",
      #     parseInt(checkbox.val()), "Date: #{Date.parse(data[1])}",
      #     "Temp: #{data[parseInt checkbox.val()]}" )
      if serie.name != "Navigator"
        checkbox = $("#cb-#{serie.name}")
        date = Date.parse(data[1])
        temp = data[parseInt checkbox.val()]
        serie.addPoint([date, temp], false)
    @chart.redraw()
    true

  # Takes one sensor index and prepares the series data to graph it.
  # The index is the sensor's index on the raw data array.
  prepareOneSerie: (index) ->
    _.map window.sampleData, (data) -> [Date.parse(data[1]), data[index]]

  # For each checked checkbox, prepare that one serie and add it to an array
  # This will be used to create the chart the first time.
  prepareData: ->
    _.map $(@seriesSelector), (checkbox) => @prepareOneSerie(checkbox.value)

  chart:  -> @chart
  series: -> @series

  # For each graphed series, memo their index.
  memoSeries: ->
    @series = { }
    _.each @chart.series, (serie, index) =>
      @series[serie.name] = index
    @series

  # Toggle the serie `name`. This requires the serie to be initialized before
  # and cached in the `@series` array.
  toggleSerie: (name) ->
    index = @series[name]
    serie = @chart.series[index]
    if serie.visible
      serie.hide()
    else
      serie.show()

  # Adds one serie to the memo array. Call this BEFORE adding the serie to the graph.
  memoSerie: (name)->
    @series[name] = @chart.series.length

  addSerie: (checkbox) ->
    name  = checkbox.name
    index = checkbox.value
    if @series[name]? # if the series is already memoized
      @toggleSerie(name)
    else
      @memoSerie(name)
      @chart.addSeries({name: name, data: @prepareOneSerie(index)})

  # Returns an array with the names of all the series.
  getSeriesNames: ->
    _.pluck $(@seriesSelector), 'name'

  pusherEventReceived: ->
    if window.sampleData.size != 0 && !@chartInitialized
      console?.log("First data received")
      @initializeChart()
      @memoSeries()
    else
      console?.log("Adding a new meassurement")
      @addNewMeassurement()

  initializeChart: ->
    # console?.log("Initializing Chart")
    preparedData = @prepareData()
    seriesNames  = @getSeriesNames()
    @chart = new Highcharts.StockChart
      chart:
        renderTo: 'container'
        defaultSeriesType: 'line'
        zoomType: 'x'

      lang:
        dataExportButton: 'Download CSV data'

      exporting:
        filename: "BEE Chart"
        width: 1300
        buttons:
          dataExportButton:
            _titleKey: 'dataExportButton'
            menuItems:[
              {
                text: 'Export all sensors'
                onclick: -> window.app.exportData()
              }

              {
                text: 'Export selected sensors'
                onclick: -> window.app.exportData(false)
              }
            ]
            hoverSymbolFill: '#768F3E',
            symbol: 'exportIcon'
            align: 'right',
            x: -62

      rangeSelector:
        buttons:[
          {
            type: 'all'
            text: 'All'
          },
          {
            type: 'day',
            count: 1,
            text: '1d'
          }
        ]
        selected: 1
      navigator: {}
      title:
        text: 'Test Chamber Temperature'
        x: -20
      subtitle:
        text: 'MIT BEE Lab'
        x: -20
      xAxis:
        type: "datetime"
        dateTimeLabelFormats:
          month: "%e %b %Y"
          year: "%b, %Y"
        minPadding: 0.05
        maxPadding: 0.05
        title:
          text: "Meassured Time"
          margin: 80
      yAxis:
        title:
          text: "Temperature (C)"

      series: _.map( seriesNames, (name, index) ->
        { name: name, data: preparedData[index] } )

    @chartInitialized = (@chart != 0)

sensor =
  toggleSensor: (event) ->
    $(this).toggleClass('on')
    _id = ($ this).data('checkbox')
    $checkbox = ($ "##{_id}")
    $checkbox.trigger('change').prop('checked', !$checkbox.prop('checked'))

class PusherListener
  constructor: (channel, app) ->
    @pusher  = new Pusher('b46f3ea8632aaeb34706')
    @channel = @pusher.subscribe(channel)
    @app = app
    @_setupListeners()


  _addRawDataRow: (rawRow) -> window.sampleData.push(rawRow)

  _setupListeners: ->
    @channel.bind 'meassurement-added', (data) =>
      # console?.log(data, "raw data from server")

      if typeof(data) == "string"
        data = data.replace(/'/g, '"')
        data = jQuery.parseJSON(data)

      # console?.log(data, "parsed data")

      @_addRawDataRow(data['rawData'])
      @app.chamber.pusherEventReceived()
      true



jQuery ($) ->
  $('.air-north, .air-south').prop('checked', true)
  $('.sensor.air').addClass('on')

  window.app = app = new Application

  ($ 'a[rel]').overlay
    top: 5
    mask:
      color: '#000'
      loadSpeed: 200
      opacity: 0.3

  $('#btnDownload').hide()
  $('sensor[title]').tooltip()
  $('.series-box').live 'change', (event) -> app.addSerie(this)
  $('.sensor').live 'click', sensor.toggleSensor
