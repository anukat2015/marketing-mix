$(document).ready(function (){
	$("#start-button").click(function (){
            $('html, body').animate({
                scrollTop: $("#q1").offset().top
            }, 800);
    });
    var qns = [1,2,3,4,5,6,7]
    $.each(qns, function (index, value) {
      $("input[name='q" + index + "']").click(function (){
            $('html, body').animate({
                scrollTop: $("#q" + value).offset().top
            }, 800);
        });
    });
    $("select[name='q1']").change(function(e){
         $('html, body').animate({
                scrollTop: $("#q2").offset().top
            }, 800);
     });
    $("select[name='q3']").change(function(e){
         $('html, body').animate({
                scrollTop: $("#q4").offset().top
            }, 800);
     });
    $("select[name='q4']").change(function(e){
         $('html, body').animate({
                scrollTop: $("#q5").offset().top
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