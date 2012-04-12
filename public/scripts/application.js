(function() {
  var Application, TestChamber,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Application = (function() {

    function Application() {
      this.chamber = new TestChamber;
    }

    Application.prototype.chamber = function() {
      return this.chamber;
    };

    return Application;

  })();

  window.TestChamber = TestChamber = (function() {

    function TestChamber(channel) {
      if (channel == null) channel = 'test_chamber';
      this.initializeChart = __bind(this.initializeChart, this);
      this.chart = 0;
      this.maxPoints = 60;
      this.initializeChart(window.sampleData, new Date());
    }

    TestChamber.prototype.prepareData = function(rawData) {
      var $collection;
      $collection = $(".series-box:checked");
      return _.map($collection, function(checkbox) {
        return _.map(rawData, function(data) {
          return [data[0] * 24 * 3600, data[checkbox.value]];
        });
      });
    };

    TestChamber.prototype.chart = function() {
      return this.chart;
    };

    TestChamber.prototype.initializeChart = function(chartData, startDate) {
      var preparedData;
      preparedData = this.prepareData(chartData);
      return this.chart = new Highcharts.StockChart({
        chart: {
          renderTo: 'container',
          defaultSeriesType: 'line',
          zoomType: 'x'
        },
        rangeSelector: {
          buttons: [
            {
              type: 'all',
              text: 'All'
            }
          ]
        },
        title: {
          text: 'Test Chamber Temperature',
          x: -20
        },
        subtitle: {
          text: 'MIT BEE Lab',
          x: -20
        },
        xAxis: {
          type: "datetime",
          dateTimeLabelFormats: {
            month: "%e %b %Y",
            year: "%b, %Y"
          },
          minPadding: 0.05,
          maxPadding: 0.05,
          title: {
            text: "Meassured Time",
            margin: 80
          }
        },
        yAxis: {
          title: {
            text: "Temperature (C)"
          }
        },
        series: [
          {
            name: 'Test Chamber Avg Temp',
            data: preparedData[0]
          }, {
            name: "External Air Temp",
            data: preparedData[1]
          }
        ]
      });
    };

    return TestChamber;

  })();

  jQuery(function($) {
    var application;
    application = new Application;
    return ($('.series-box')).change(function(event) {
      var index, serie;
      index = +($(this)).val() - 1;
      serie = application.chamber.chart.series[index];
      if (serie.visible) {
        return serie.hide();
      } else {
        return serie.show();
      }
    });
  });

}).call(this);
