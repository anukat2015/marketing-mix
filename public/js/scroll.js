$(document).ready(function (){
	$("#arrow").click(function (){
            $('html, body').animate({
                scrollTop: $("#q1").offset().top
            }, 800);
    });
    $("label.q1").click(function (){
            $('html, body').animate({
                scrollTop: $("#q2").offset().top
            }, 800);
    });
    $("#businesses2, #consumers2").click(function (){
            $('html, body').animate({
                scrollTop: $("#q3").offset().top
            }, 800);
    });
    $("#lessthan5, #5to100, #morethan100, #100to1000, #morethan1000").click(function (){
            $('html, body').animate({
                scrollTop: $("#q4").offset().top
            }, 800);
    });
    $("#low4, #medium4, #high4").click(function (){
            $('html, body').animate({
                scrollTop: $("#q5").offset().top
            }, 800);
    });
    $("#yes5, #no5").click(function (){
            $('html, body').animate({
                scrollTop: $("#q6").offset().top
            }, 800);
    });
    var winHeight = $(window).height(), 
      docHeight = $(document).height(),
      progressBar = $('progress'),
      max, value;

    /* Set the max scrollable area */
    max = docHeight - winHeight;
    progressBar.attr('max', max);

    $(document).on('scroll', function(){
     value = $(window).scrollTop();
     progressBar.attr('value', value);
    });
});