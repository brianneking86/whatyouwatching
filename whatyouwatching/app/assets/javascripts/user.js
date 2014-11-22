$(document).ready(function(){
  $('.sort_by_rating').hide();

  $('#sort_friends').on("click", function(){
    $('.sort_by_rating').hide();
    $('.sort_by_friends').show();
  });

  $('#sort_rating').on("click", function(){
    $('.sort_by_friends').hide();
    $('.sort_by_rating').show();
  });
});