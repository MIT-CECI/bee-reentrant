(function() {
  var Application, PusherListener, TestChamber, sensor;

  window.BEE = {
    version: '3.1.0'
  };

  Application = (function() {

    function Application() {
      var experimentChannel, _ref;
      experimentChannel = (_ref = window.pusherChannel) != null ? _ref : window.pusherChannel = 'experiment-channel';
      this.chamber = new TestChamber;
      this.pusherListener = new PusherListener(experimentChannel, this);
    }

    Application.prototype.pusherListener = function() {
      return this.pusherListener;
    };

    Application.prototype.chamber = function() {
      return this.chamber;
    };

    Application.prototype.addSerie = function(name, index) {
      return this.chamber.addSerie(name, index);
    };

    Application.prototype.exportData = function(select_all) {
      var baseSerie, chart, extremes, indexes;
      if (select_all == null) {
        select_all = true;
      }
      chart = this.chamber.chart;
      baseSerie = chart.xAxis[0];
      extremes = baseSerie.getExtremes();
      indexes = this.getIndexes(extremes);
      $('input#hdnMin').val(indexes[0]);
      $('input#hdnMax').val(indexes[1]);
      if (select_all) {
        $('input#hdnSensors').val("");
      } else {
        $('input#hdnSensors').val(this.getSelectedSensors(select_all));
      }
      return $('#btnDownload').click();
    };

    Application.prototype.getSelectedSensors = function() {
      return _.map($(this.chamber.seriesSelector), function(checkbox, index) {
        return checkbox.value;
      });
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

    TestChamber.prototype.seriesSelector = '.series-box:checked';

    function TestChamber() {
      this.chart = 0;
      this.maxPoints = 60;
      this.series = [];
      this.chartInitialized = false;
      if (window.sampleData.length !== 0) {
        this.initializeChart();
        this.memoSeries();
      }
    }

    TestChamber.prototype.addNewMeassurement = function() {
      var data,
        _this = this;
      data = window.sampleData[window.sampleData.length - 1];
      _.each(this.chart.series, function(serie, index) {
        var checkbox, date, temp;
        if (serie.name !== "Navigator") {
          checkbox = $("#cb-" + serie.name);
          date = Date.parse(data[0]);
          temp = data[parseInt(checkbox.val())];
          return serie.addPoint([date, temp], false);
        }
      });
      this.chart.redraw();
      return true;
    };

    TestChamber.prototype.prepareOneSerie = function(index) {
      return _.map(window.sampleData, function(data) {
        return [Date.parse(data[0]), data[index]];
      });
    };

    TestChamber.prototype.prepareData = function() {
      var results,
        _this = this;
      results = _.map($(this.seriesSelector), function(checkbox) {
        return _this.prepareOneSerie(checkbox.value);
      });
      return results;
    };

    TestChamber.prototype.chart = function() {
      return this.chart;
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

    TestChamber.prototype.toggleSerie = function(name) {
      var index, serie;
      index = this.series[name];
      serie = this.chart.series[index];
      if (serie.visible) {
        return serie.hide();
      } else {
        return serie.show();
      }
    };

    TestChamber.prototype.memoSerie = function(name) {
      return this.series[name] = this.chart.series.length;
    };

    TestChamber.prototype.addSerie = function(checkbox) {
      var index, name;
      name = checkbox.name;
      index = checkbox.value;
      if (this.series[name] != null) {
        return this.toggleSerie(name);
      } else {
        this.memoSerie(name);
        return this.chart.addSeries({
          name: name,
          data: this.prepareOneSerie(index),
          yAxis: (!!name.match(/wattz/i) ? 1 : 0)
        });
      }
    };

    TestChamber.prototype.getSeriesNames = function() {
      return _.pluck($(this.seriesSelector), 'name');
    };

    TestChamber.prototype.pusherEventReceived = function() {
      if (window.sampleData.size !== 0 && !this.chartInitialized) {
        this.initializeChart();
        return this.memoSeries();
      } else {
        return this.addNewMeassurement();
      }
    };

    TestChamber.prototype.initializeChart = function() {
      var preparedData, seriesNames;
      preparedData = this.prepareData();
      seriesNames = this.getSeriesNames();
      this.chart = new Highcharts.StockChart({
        chart: {
          renderTo: 'container',
          defaultSeriesType: 'line',
          zoomType: 'x'
        },
        lang: {
          dataExportButton: 'Download CSV data'
        },
        exporting: {
          filename: "BEE Chart",
          width: 1300,
          buttons: {
            dataExportButton: {
              _titleKey: 'dataExportButton',
              menuItems: [
                {
                  text: 'Export all sensors',
                  onclick: function() {
                    return window.app.exportData();
                  }
                }, {
                  text: 'Export selected sensors',
                  onclick: function() {
                    return window.app.exportData(false);
                  }
                }
              ],
              hoverSymbolFill: '#768F3E',
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
        yAxis: [
          {
            title: {
              text: "Temperature (C)"
            }
          }, {
            title: {
              text: "Total Wattage"
            },
            opposite: true,
            min: 0,
            max: 450
          }
        ],
        series: _.map(seriesNames, function(name, index) {
          return {
            name: name,
            data: preparedData[index],
            yAxis: 0
          };
        })
      });
      return this.chartInitialized = this.chart !== 0;
    };

    return TestChamber;

  })();

  sensor = {
    toggleSensor: function(event) {
      var $checkbox, _id;
      $(this).toggleClass('on');
      _id = ($(this)).data('checkbox');
      $checkbox = $("#" + _id);
      return $checkbox.trigger('change').prop('checked', !$checkbox.prop('checked'));
    }
  };

  PusherListener = (function() {

    function PusherListener(channel, app) {
      this.pusher = new Pusher('b46f3ea8632aaeb34706');
      this.channel = this.pusher.subscribe(channel);
      this.app = app;
      this._setupListeners();
    }

    PusherListener.prototype._addRawDataRow = function(rawRow) {
      return window.sampleData.push(rawRow);
    };

    PusherListener.prototype._setupListeners = function() {
      var _this = this;
      return this.channel.bind('meassurement-added', function(data) {
        if (typeof data === "string") {
          data = data.replace(/'/g, '"');
          data = jQuery.parseJSON(data);
        }
        _this._addRawDataRow(data['rawData']);
        _this.app.chamber.pusherEventReceived();
        return true;
      });
    };

    return PusherListener;

  })();

  jQuery(function($) {
    var app;
    $('.air-north, .air-south').prop('checked', true);
    $('.sensor.air').addClass('on');
    window.app = app = new Application;
    ($('a[rel]')).overlay({
      top: 5,
      mask: {
        color: '#000',
        loadSpeed: 200,
        opacity: 0.3
      }
    });
    $('#btnDownload').hide();
    $('sensor[title]').tooltip();
    $('.series-box').live('change', function(event) {
      return app.addSerie(this);
    });
    return $('.sensor').live('click', sensor.toggleSensor);
  });

}).call(this);
