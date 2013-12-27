//= require application
//= require jquery_ujs
//= require plugin/jquery.fancybox
//= require plugin/jquery.uri.js

$(document).ready(function() {
    $("a.simple_image").fancybox({
        'opacity'   : true,
        'overlayShow'        : true,
        'overlayColor': '#000000',
        'overlayOpacity'     : 0.9,
        'titleShow':true,
        'transitionIn'  : 'elastic',
        'transitionOut' : 'elastic'
      });
});