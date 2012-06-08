# Version 2.0.0

class Application
  constructor: -> @chamber = new TestChamber
  chamber: -> @chamber

  # Public API for adding a serie. Receives the name of the serie and the
  # index of the array it points to.
  addSerie: (name, index) -> @chamber.addSerie(name, index)

  exportData: (select_all = true) ->
    chart = @chamber.chart
    baseSerie = chart.xAxis[0]
    extremes = baseSerie.getExtremes()
    indexes = @getIndexes(extremes)

    ($ 'input#min').val(window.sampleData[indexes[0]][0])
    ($ 'input#max').val(window.sampleData[indexes[1]][0])
    if select_all
      ($ 'input#sensors').val("")
    else
      ($ 'input#sensors').val(@getSelectedSensors(select_all))
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
    @initializeChart()
    @memoSeries()

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
    if @series[name]?
      @toggleSerie(name)
    else
      @memoSerie(name)
      @chart.addSeries({name: name, data: @prepareOneSerie(index)})

  # Returns an array with the names of all the series.
  getSeriesNames: ->
    _.pluck $(@seriesSelector), 'name'

  initializeChart: ->
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

sensor =
  toggleSensor: (event) ->
    $(this).toggleClass('on')
    _id = ($ this).data('checkbox')
    $checkbox = ($ "##{_id}")
    $checkbox.trigger('change').prop('checked', !$checkbox.prop('checked'))

jQuery ($) ->
  ($ '.air-north, .air-south').prop('checked', true)
  ($ '.sensor.air').addClass('on')

  window.app = app = new Application
  ($ 'a[rel]').overlay
    top: 5
    mask:
      color: '#000'
      loadSpeed: 200
      opacity: 0.3

  ($ '#btnDownload').hide()
  ($ 'sensor[title]').tooltip()
  ($ '.series-box').live 'change', (event) -> app.addSerie(this)
  ($ '.sensor').live 'click', sensor.toggleSensor
