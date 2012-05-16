
class Application
  constructor: -> @chamber = new TestChamber
  chamber: -> @chamber

  selectDiv: (holder) ->
    @clearSelection()

    if document.selection
      range = document.body.createTextRange()
      range.moveToElementText(document.getElementById(holder))
      range.select()

    else if window.getSelection
      range = document.createRange()
      range.selectNode(document.getElementById(holder))
      window.getSelection().addRange(range)

  clearSelection: ->
    if document.selection
      document.selection.empty()
    else if window.getSelection
      window.getSelection().removeAllRanges()

  exportData: ->
    chart = @chamber.chart
    baseSerie = chart.xAxis[0]
    extremes = baseSerie.getExtremes()
    indexes = @getIndexes(extremes)
    ($ '#data-holder').text @extractData(indexes[0], indexes[1]).toString()
    ($ '.hidden').show()

  extractData: (from, to) ->
    window.sampleData[i] for i in [from..to]

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
      time = Date.parse(window.sampleData[mid][0])
      if time > timestamp
        high = mid - 1
      else if time < timestamp
        low = mid + 1
      else
        return mid
    # Since the data can be average, get the previous  valid meassurement
    low - 1

window.TestChamber = class TestChamber
  constructor: (channel = 'test_chamber') ->
    @chart = 0
    @maxPoints = 60
    @series = 0
    @initializeChart(window.sampleData, new Date())
    @memoSeries()

  prepareData: (rawData) ->
    $collection = $(".series-box")
    _.map $collection, (checkbox) ->
      jBox = ($ checkbox)
      _.map rawData, (data) ->
        [Date.parse(data[0]), data[jBox.data('array-index')]]

  series: -> @series

  memoSeries: ->
    @series = { }
    _.each @chart.series, (serie, index) =>
      @series[serie.name] = index
    @series

  chart: -> @chart

  getSeries: ->
    $collection = $(".series-box")
    _.pluck $collection, 'name'

  initializeChart: (chartData, startDate) =>
    preparedData = @prepareData(chartData)
    seriesNames = @getSeries()
    @chart = new Highcharts.StockChart
      chart:
        renderTo: 'container'
        defaultSeriesType: 'line'
        zoomType: 'x'

      exporting:
        filename: "BEE Chart"
        width: 1300
        buttons:
          dataExportButton:
            hoverSymbolFill: '#768F3E',
            onclick: -> window.app.exportData()
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

      series: _.map( seriesNames, (name, index) -> { name: name, data: preparedData[index] } )

jQuery ($) ->
  window.app = application = new Application
  ($ '#copy-text').click ->
    application.selectDiv('data-holder')

  ($ '.series-box').live 'change', (event) ->
    index = application.chamber.series[this.name]
    serie = application.chamber.chart.series[index]
    if $(this).attr("checked") == "checked"
      serie.show()
    else
      serie.hide()

  ($ '.series-box').trigger('change')
