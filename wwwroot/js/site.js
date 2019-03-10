// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your Javascript code.

$(document).ready(
    function () {
    if ( $(window).width() > 769) {   
        var mywindow = $(window);
        var mypos = mywindow.scrollTop();
        var up = false;
        var newscroll;
        mywindow.scroll(function () {
            newscroll = mywindow.scrollTop();
            if (newscroll > mypos && !up) {
                $('#nav').finish().slideUp(400);
                up = !up;
                console.log(up);
            } else if(newscroll < mypos && up) {
                $('#nav').finish().slideDown(300);
                up = !up;
            }
            mypos = newscroll;
        });
        }})

        