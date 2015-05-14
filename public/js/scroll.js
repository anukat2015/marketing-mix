$(document).ready(function (){
	$("#arrow").click(function (){
            $('html, body').animate({
                scrollTop: $("#q1").offset().top
            }, 800);
    });
    $("#yes1, #no1").click(function (){
            $('html, body').animate({
                scrollTop: $("#q2").offset().top
            }, 800);
    });
    $("#yes2, #no2").click(function (){
            $('html, body').animate({
                scrollTop: $("#q3").offset().top
            }, 800);
    });
    $("#yes3, #no3").click(function (){
            $('html, body').animate({
                scrollTop: $("#q4").offset().top
            }, 800);
    });
    $("#yes4, #no4").click(function (){
            $('html, body').animate({
                scrollTop: $("#q5").offset().top
            }, 800);
    });
    $("#yes5, #no5").click(function (){
            $('html, body').animate({
                scrollTop: $("#q6").offset().top
            }, 800);
    });
    $("#yes6, #no6").click(function (){
            $('html, body').animate({
                scrollTop: $("#q7").offset().top
            }, 800);
    });
    $("#yes7, #no7").click(function (){
            $('html, body').animate({
                scrollTop: $("#q8").offset().top
            }, 800);
    });
    $("#yes8, #no8").click(function (){
            $('html, body').animate({
                scrollTop: $("#q9").offset().top
            }, 800);
    });
    $("#yes9, #no9").click(function (){
            $('html, body').animate({
                scrollTop: $("#q10").offset().top
            }, 800);
    });
    $("#next").click(function (){
            $('html, body').animate({
                scrollTop: $("#q11").offset().top
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