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
    e.preventDefault();
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

  $("#add-contact-button").on('click', function(e){
    e.preventDefault();
    var $newContactButton = $(this);
    $.ajax({
      url: $newContactButton.attr('href'),
      method: 'get'
    }).done(function(response){
      $("#add-contact-button").addClass('disabled')
      $(".contact-list").prepend(response);
    })
  })

  $(".contact-list").on("submit", ".new-contact-form", function(e){
    e.preventDefault();
    var $newContactForm = $(this.firstElementChild);
    $.ajax({
      url: $newContactForm.attr('action'),
      method: $newContactForm.attr('method'),
      data: $newContactForm.serialize()
    }).done(function(data){
      console.log(data)
      $(".contact-list div").first().remove();
      $(".contact-list").prepend(data);
      $("#add-contact-button").removeClass('disabled')
    })
  })

  $(".contact-list").bind("input propertychange", ".new-contact-form", function(){
    var name = document.getElementById('contact_name').value
    var role = document.getElementById('contact_role').value
    var email = document.getElementById('contact_email').value
    var phone = document.getElementById('contact_phone').value
    var dm = document.getElementById('contact_decision_maker').value
    var contactFormSubmit = document.getElementById('contact_submit')

    if (
      name.length > 0
      && role.length > 0
      && email.length > 0
      && phone.length > 0
      && dm
    ) {
      contactFormSubmit.disabled = false
    } else {
      contactFormSubmit.disabled = true
    };
  })

  $(".contact-list-item").on("click", ".edit-contact", function(e){
    e.preventDefault();
    var $contactEdit = $(this);
    $.ajax({
      url: $contactEdit.attr('href'),
      method: $contactEdit.attr('method')
    }).done(function(response){
      $contactEdit.parents(".contact-list-item").append(response);
      $contactEdit.parents(".contact-row").hide();
    })
  })

  $(".contact-list-item").on("click", ".close-contact-edit", function(e){
    e.preventDefault();
    $(this).parents(".contact-list-item").children(".contact-row").show();
    $(this).parents(".contact-edit-container").remove();
  })

})
