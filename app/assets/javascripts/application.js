//= require jquery3
//= require jquery_ujs
//= require popper
//= require bootstrap-sprockets

$(document).ready(function(){
  $("#marketingCarousel").carousel();

  $(".add-comment-container").on('click', '#add-comment-button', function(e){
    e.preventDefault();
    var $newCommentButton = $(this);
    $.ajax({
      url: $newCommentButton.attr('href'),
      method: 'get'
    }).done(function(response){
      $("#add-comment-button").addClass('disabled')
      $(".new-comment-container").append(response);
    })
  })

  $(".new-comment-container").on("submit", ".new-comment-form", function(e){
    e.preventDefault(e);
    var $newCommentForm = $(this.firstElementChild);
    $.ajax({
      url: $newCommentForm.attr('action'),
      method: $newCommentForm.attr('method'),
      data: $newCommentForm.serialize()
    }).done(function(data){
      console.log(data)
    })
  })

})
