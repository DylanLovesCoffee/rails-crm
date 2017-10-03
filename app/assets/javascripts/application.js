//= require jquery3
//= require jquery_ujs
//= require popper
//= require bootstrap-sprockets

$(document).ready(function(){
  $("#marketingCarousel").carousel();

  $(".add-comment-container").on('click', '#add-comment', function(e){
    e.preventDefault();
    var $newCommentButton = $(this)
    $.ajax({
      url: $newCommentButton.attr('href'),
      method: 'get'
    }).done(function(response){
      console.log(response)
    })
  })
})
