// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

// forces mobile address bar to scroll up
if (/mobile/i.test(navigator.userAgent) && !window.location.hash) { window.onload = function () {
  window.scrollTo(0, 1);
}; }

var CC = function(){

  var app = {


    background_image : function(path){
      $.backstretch("/assets/" + path, {fade: 1500});
    },



    handle_discover_intro : function(){
      var c = $('.intro-section');
      var b = c.find('a.more');
      var p;
      
      b.on('click', function(e){
        e.preventDefault();
        e.stopPropagation();

        $(this).text() == "MORE" ? $(this).text("CLOSE") : $(this).text("MORE");

        p = $(this).parent().parent();

        if ( p.hasClass('opened') ){ 
          
          p.find('.right-container').toggleClass('open');

          setTimeout(function(){
            p.toggleClass('opened');  
          }, 500);

        }else{
          p.toggleClass('opened');
          p.find('.right-container').toggleClass('open');
        }

      })
    },



    animate_discover_section : function(){
      var h = $('.page-header');

      if( h.size() > 0 ){
        if(h.find('h1').text() == "Discover"){
          var b = $('.button-big').fadeOut(0);

          $('#intro-splash').delay(500).animate({opacity: 1}, 500);
          
          b.eq(0).delay(600).fadeTo(500, 1);
          b.eq(1).delay(700).fadeTo(500, 1);
          
        }

        if(h.find('h1').text() == "Discover by Brand"){
          // to refactor intro animation/component
          var b = $('.button-big').fadeOut(0);

          $('#intro-splash').delay(500).animate({opacity: 1}, 500);
          
          b.eq(0).delay(600).fadeTo(500, 1);
          b.eq(1).delay(700).fadeTo(500, 1);
          
        }
        if(h.find('h1').text() == "Discover by Initiative"){
          // to refactor intro animation/component
          var b = $('.button-big').fadeOut(0);

          $('#intro-splash').delay(500).animate({opacity: 1}, 500);
          
          b.eq(0).delay(600).fadeTo(500, 1);
          b.eq(1).delay(700).fadeTo(500, 1);
          
        }
      }
    },



    grid_items_overlay : function(){
      if($('.content-grid').size() > 0) {
        var items = $('.content-grid .item');

        items.hoverIntent({
          over: function(){
            $(this).find('.overlay').addClass('opened');
          },
          out: function(){
            $(this).find('.overlay').removeClass('opened');
          }
        });
      }
    },



    click_handler_on_items : function(){
      
      $('.item').on('click', function () {
        if($(this).data('url') !== undefined){

          if( $(this).data('blank') == true ) {
            var win = window.open($(this).data('url'), '_blank');
            win.focus();
          }else{
            window.location.href = ($(this).data('url'));  
          }

        }
      });  
      
      
    },

  };

  return {
    on_ready : function(){
      app.animate_discover_section();
      app.handle_discover_intro();
      app.grid_items_overlay();
      app.click_handler_on_items();
    },
    load_background : function(path){
      app.background_image(path);
    }
  }

}();


jQuery(document).ready(function($) {
  CC.on_ready();
});


