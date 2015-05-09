var chart = c3.generate({
    data: {
        columns: [
            ["Paid Social", 20],
            ["Display Advertising", 40],
            ["Paid Search", 40],
            ["Content Marketing", 40],
            ["Direct Sales", 40],
            ["Organic Social", 40],
            ["SEO", 40],
            ["PR", 40],
            ["Influencer Marketing", 40],
            ["Local Marketing", 40],
            ["Referral Marketing", 40],
            ["Email Marketing", 40],
            ["Partnerships", 40],
        ],
        type : 'pie',
        onclick: function (d, i) { console.log("onclick", d, i); },
        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
        onmouseout: function (d, i) { console.log("onmouseout", d, i); }
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
