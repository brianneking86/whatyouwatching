$(document).ready(function(){
  $('.sort_by_rating').hide();
  $('.show_info').hide();
  $('#my_show_list').show();
  $('#my_friends_list').hide();

  $('.show_wrapper').on("click", "#sort_friends" ,function(){
    $('.sort_by_rating').hide();
    $('.sort_by_friends').show();
  });

  $('.show_wrapper').on("click", '#sort_rating' ,function(){
    $('.sort_by_friends').hide();
    $('.sort_by_rating').show();
  });

  $('.show_wrapper').on("click", '.show_title' ,function(e){
    e.stopPropagation();
    $(this).children('.show_info').toggle();
  });

  $('.show_wrapper').on("click", '#my_shows' ,function(e){
    e.stopPropagation();
    $('#my_show_list').toggle();
  });

  $('.show_wrapper').on("click", '#my_friends' ,function(e){
    e.stopPropagation();
    $('#my_friends_list').toggle();
  });

});
