//= require jquery3
//= require jquery_ujs
//= require popper
//= require bootstrap-sprockets

$(document).ready(function(){
  $("#marketingCarousel").carousel();

  $("#add-comment").on('click', function(e){
    e.preventDefault();
  })
})
