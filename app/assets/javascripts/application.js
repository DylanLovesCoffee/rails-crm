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
      $(".comment-list").prepend(response);
    })
  })

  $(".comment-list").on("submit", ".new-comment-form", function(e){
    e.preventDefault(e);
    var $newCommentForm = $(this.firstElementChild);
    $.ajax({
      url: $newCommentForm.attr('action'),
      method: $newCommentForm.attr('method'),
      data: $newCommentForm.serialize()
    }).done(function(data){
      $(".comment-list div").first().remove();
      $(".comment-list").prepend(data);
      $("#add-comment-button").removeClass('disabled')
    })
  })

  $(".comment-list").bind("input propertychange", ".new-comment-container", function(){
    var commentFormBody = document.getElementById('comment_body').value
    var commentFormSubmit = document.getElementById('comment_submit')

    if (commentFormBody.length > 0) {
      commentFormSubmit.disabled = false
    } else {
      commentFormSubmit.disabled = true
    };
  })

})
