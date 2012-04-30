class Application
  constructor: -> @chamber = new TestChamber

  chamber: -> @chamber

window.TestChamber = class TestChamber
  constructor: (channel = 'test_chamber') ->
    @chart = 0
    @maxPoints = 60
    @initializeChart(window.sampleData, new Date())

  prepareData: (rawData) ->
    $collection = $(".series-box:checked")
    _.map $collection, (checkbox) ->
      jBox = $(checkbox);
      _.map rawData, (data) ->
        [Date.parse(data[0]), data[jBox.data('series-index')]]

  chart: -> @chart

  getSeries: ->
    $collection = $(".series-box:checked")
    _.pluck $collection, 'name'

  initializeChart: (chartData, startDate) =>
    preparedData = @prepareData(chartData)
    seriesNames = @getSeries()
    @chart = new Highcharts.StockChart
      chart:
        renderTo: 'container'
        defaultSeriesType: 'line'
        zoomType: 'x'

      rangeSelector:
        buttons: [
            type: 'all'
            text: 'All'
          ]
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
  application = new Application
  ($ '.series-box').change (event) ->
    index = +($ this).val() - 1
    serie = application.chamber.chart.series[index]
    if serie.visible
      serie.hide()
    else
      serie.show()