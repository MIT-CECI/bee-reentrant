(function() {
  var Application, TestChamber,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Application = (function() {

    Application.name = 'Application';

    function Application() {
      this.chamber = new TestChamber;
    }

    Application.prototype.chamber = function() {
      return this.chamber;
    };

    Application.prototype.selectDiv = function(holder) {
      var range;
      this.clearSelection();
      if (document.selection) {
        range = document.body.createTextRange();
        range.moveToElementText(document.getElementById(holder));
        return range.select();
      } else if (window.getSelection) {
        range = document.createRange();
        range.selectNode(document.getElementById(holder));
        return window.getSelection().addRange(range);
      }
    };

    Application.prototype.clearSelection = function() {
      if (document.selection) {
        return document.selection.empty();
      } else if (window.getSelection) {
        return window.getSelection().removeAllRanges();
      }
    };

    Application.prototype.exportData = function() {
      var baseSerie, chart, extremes, indexes;
      chart = this.chamber.chart;
      baseSerie = chart.xAxis[0];
      extremes = baseSerie.getExtremes();
      indexes = this.getIndexes(extremes);
      ($('#data-holder')).text(this.extractData(indexes[0], indexes[1]).toString());
      return ($('.hidden')).show();
    };

    Application.prototype.extractData = function(from, to) {
      var i, _i, _results;
      _results = [];
      for (i = _i = from; from <= to ? _i <= to : _i >= to; i = from <= to ? ++_i : --_i) {
        _results.push(window.sampleData[i]);
      }
      return _results;
    };

    Application.prototype.getIndexes = function(extremes) {
      return [this.binarySearch(extremes.min), this.binarySearch(extremes.max)];
    };

    Application.prototype.binarySearch = function(timestamp) {
      var high, low, mid, time;
      low = 0;
      high = window.sampleData.length - 1;
      while (high >= low) {
        mid = Math.floor((low + high) / 2);
        time = Date.parse(window.sampleData[mid][0]);
        if (time > timestamp) {
          high = mid - 1;
        } else if (time < timestamp) {
          low = mid + 1;
        } else {
          return mid;
        }
      }
      return low - 1;
    };

    return Application;

  })();

  window.TestChamber = TestChamber = (function() {

    TestChamber.name = 'TestChamber';

    function TestChamber(channel) {
      if (channel == null) {
        channel = 'test_chamber';
      }
      this.initializeChart = __bind(this.initializeChart, this);

      this.chart = 0;
      this.maxPoints = 60;
      this.series = 0;
      this.initializeChart(window.sampleData, new Date());
      this.memoSeries();
    }

    TestChamber.prototype.prepareData = function(rawData) {
      var $collection;
      $collection = $(".series-box");
      return _.map($collection, function(checkbox) {
        var jBox;
        jBox = $(checkbox);
        return _.map(rawData, function(data) {
          return [Date.parse(data[0]), data[jBox.data('array-index')]];
        });
      });
    };

    TestChamber.prototype.series = function() {
      return this.series;
    };

    TestChamber.prototype.memoSeries = function() {
      var _this = this;
      this.series = {};
      _.each(this.chart.series, function(serie, index) {
        return _this.series[serie.name] = index;
      });
      return this.series;
    };

    TestChamber.prototype.chart = function() {
      return this.chart;
    };

    TestChamber.prototype.getSeries = function() {
      var $collection;
      $collection = $(".series-box");
      return _.pluck($collection, 'name');
    };

    TestChamber.prototype.initializeChart = function(chartData, startDate) {
      var preparedData, seriesNames;
      preparedData = this.prepareData(chartData);
      seriesNames = this.getSeries();
      return this.chart = new Highcharts.StockChart({
        chart: {
          renderTo: 'container',
          defaultSeriesType: 'line',
          zoomType: 'x'
        },
        exporting: {
          filename: "BEE Chart",
          width: 1300,
          buttons: {
            dataExportButton: {
              hoverSymbolFill: '#768F3E',
              onclick: function() {
                return window.app.exportData();
              },
              symbol: 'exportIcon',
              align: 'right',
              x: -62
            }
          }
        },
        rangeSelector: {
          buttons: [
            {
              type: 'all',
              text: 'All'
            }, {
              type: 'day',
              count: 1,
              text: '1d'
            }
          ],
          selected: 1
        },
        navigator: {},
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
        series: _.map(seriesNames, function(name, index) {
          return {
            name: name,
            data: preparedData[index]
          };
        })
      });
    };

    return TestChamber;

  })();

  jQuery(function($) {
    var application;
    window.app = application = new Application;
    ($('#copy-text')).click(function() {
      return application.selectDiv('data-holder');
    });
    ($('.series-box')).live('change', function(event) {
      var index, serie;
      index = application.chamber.series[this.name];
      serie = application.chamber.chart.series[index];
      if ($(this).attr("checked") === "checked") {
        return serie.show();
      } else {
        return serie.hide();
      }
    });
    return ($('.series-box')).trigger('change');
  });

}).call(this);
