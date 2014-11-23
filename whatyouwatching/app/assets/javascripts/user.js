$(document).ready(function(){
  $('.sort_by_rating').hide();
  $('.show_info').hide();
  $('#my_show_list').hide();
  $('#my_friends_list').hide();

  $('.wrapper').on("click", "#sort_friends" ,function(){
    $('.sort_by_rating').hide();
    $('.sort_by_friends').show();
  });

  $('.wrapper').on("click", '#sort_rating' ,function(){
    $('.sort_by_friends').hide();
    $('.sort_by_rating').show();
  });

  $('.wrapper').on("click", '.show_title' ,function(e){
    e.stopPropagation();
    $(this).children('ul').toggle();
  });

  $('.wrapper').on("click", '#my_shows' ,function(e){
    e.stopPropagation();
    $('#my_show_list').toggle();
  });

  $('.wrapper').on("click", '#my_friends' ,function(e){
    e.stopPropagation();
    $('#my_friends_list').toggle();
  });

  var ul = $('.list-inline')
  ul.children().each(function(i,li){ul.prepend(li)})
});
