$(function () {
  if (gon.chart_age_population) {
    var chart;
    $(document).ready(function() {
        var options = {
            chart: {
                renderTo: 'chart_age_population',
                type: 'spline'
            },
            title: {
                text: gon.chart_age_pop_title,
                style: {
                  color: '#fff'
                }
            },
            subtitle: {
                text: gon.chart_age_pop_subtitle,
                style: {
                  color: '#ffeaad'
                }
            },
            xAxis: {
                title: {
                    text: gon.chart_age_pop_xaxis,
                    style: {
                      color: '#ffeaad'
                    }
                },
                labels: {
                  formatter: function() {
                        return this.value + '<br/> (' + (gon.static_year-this.value) + ')';
                  },
                  style: {
                    color: 'rgba(255, 255, 255, .75)'
                  }
                }
            },
            tooltip: {
                crosshairs: true,
                formatter: function() {
                    var x;
                    if (this.series.index == 1) {
                      // the values for count and rank have switched places
                      x = '<strong>' + this.x +' (' + (gon.static_year-this.x) + gon.chart_age_pop_popup_years_old + ')</strong>'+ 
                          '<br/>' + gon.chart_age_pop_popup_total + Highcharts.numberFormat(this.point.config[2],0,',') +
                          '<br />' + gon.chart_age_pop_popup_rank + this.y;
                    } else {
                      x = '<strong>' + this.x +' (' + (gon.static_year-this.x) + gon.chart_age_pop_popup_years_old + ')</strong>'+ 
                          '<br/>' + gon.chart_age_pop_popup_total + Highcharts.numberFormat(this.y,0,',');
                      if (this.point.config.length > 2){
                        x += '<br />' + gon.chart_age_pop_popup_rank + this.point.config[2];
                      }
                    }
                    return x;
                },
                backgroundColor: '#fff',
                borderWidth: 0,
                borderRadius: 0,
                shadow: false,
                style: {
                  color: 'rgba(0, 0, 0, .6)',
                  padding: 8
                }
            },
            plotOptions: {
              series: {
                color: '#fff'
              }
            }
        };
        
        // if secondary y axis/data is needed include it
        if (gon.chart_age_pop_yaxis2 && gon.chart_age_rank_data) {
          // set the y-axis
          options.yAxis = [{ // Primary yAxis
                labels: {
                    style: {
	                    color: 'rgba(255, 255, 255, .75)'
                    }
                },
                title: {
                    text: gon.chart_age_pop_yaxis,
                    style: {
	                    color: '#ffeaad',
	                    fontWeight: 'normal'
                    }
                },
                min: 0
            }, { // Secondary yAxis
                labels: {
                    style: {
                        color: '#AA4643'
                    }
                },
                title: {
                    text: gon.chart_age_pop_yaxis2,
                    style: {
                        color: '#AA4643'
                    }                    
                },
                min: 0,
                reversed: true,
                opposite: true
            }];
            
            // set the data series
            options.series = [{
                //showInLegend: false,
                name: gon.chart_age_pop_yaxis,
                cursor: 'pointer',
                color: '#4572A7',
                point: {
                        events: {
                            click: function() {
                                location.href = gon.year_path + this.x;
                            }
                        }
                    },
                data: gon.chart_age_pop_data
            }, {
                //showInLegend: false,
                name: gon.chart_age_pop_yaxis2,
                yAxis: 1,
                color: '#AA4643',
                cursor: 'pointer',
                point: {
                        events: {
                            click: function() {
                                location.href = gon.year_path + this.x;
                            }
                        }
                    },
                data: gon.chart_age_rank_data
            }];

        } else {
          // set the y-axis
          options.yAxis = {
                title: {
                    text: gon.chart_age_pop_yaxis,
                    style: {
	                    color: '#ffeaad',
	                    fontWeight: 'normal'
                    }
                },
                labels: {
                    style: {
	                    color: 'rgba(255, 255, 255, .75)'
                    }
                },
                min: 0
            };
            
            // set the data series
            options.series = [{
                showInLegend: false,
                cursor: 'pointer',
                point: {
                        events: {
                            click: function() {
                                location.href = gon.year_path + this.x;
                            }
                        }
                    },
                data: gon.chart_age_pop_data
            }]

        }

        chart = new Highcharts.Chart(options);
        
    });
  }    
});
