$(function(){
  var ul = $('.list-inline')
  ul.children().each(function(i,li){ul.prepend(li)})
})