var chart = c3.generate({
                bindto: "#score_chart",
                data: {
                    columns: [
                        <% results.each do | k, v | %>
                            <% if v[:sum] != 0 %>
                                [ "<%= v[:name] %>", <%= v[:sum] %> ],
                            <% end %>
                        <% end %>
                    ],
                    type : 'pie',
                    onclick: function (d, i) { console.log("onclick", d, i); },
                    onmouseover: function (d, i) {
                        console.log("onmouseover", d, i);
                    },
                    onmouseout: function (d, i) { console.log("onmouseout", d, i); }
                },
                transition: {
                    duration: 0
                },
                legend: {
                    position: 'right'
                },
                pie: {
                  label: {
                    show: false
                  }
                }
            });

            setTimeout(function () {
                chart.unload({
                    ids: 'data1'
                });
                chart.unload({
                    ids: 'data2'
                });
            }, 2500);