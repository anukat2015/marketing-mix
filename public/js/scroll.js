$(document).ready(function (){
	$("#arrow").click(function (){
            $('html, body').animate({
                scrollTop: $("#q1").offset().top
            }, 800);
    });
    var i;
    for (i = 1; i < 6; i++) {
        $("input[name='q" + i + "']").click(function (){
            $('html, body').animate({
                scrollTop: $("#q2").offset().top
            }, 800);
        });
    }
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