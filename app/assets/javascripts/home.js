// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function () {
  var bindFilterButton = function () {
    $('#filter-button').off().on("click", function (e) {
      e.preventDefault();
      var filters = {
        day: $("#select-day").val(),
        time: $("#select-time").val(),
        location: $("#select-location").val(),
        price: $("#select-price").val(),
        drink: $("#select-drink").val(),
        features: $("#select-features").val(),
      };

      // this returns the appropriate query string
      window.location.href = "/?" + $.param(filters);
    })
  }
  bindFilterButton();

  $('#signup-form').on('submit', function(e){
    e.preventDefault();

  $.auth.emailSignUp({
    email: $('#signup-form input[name="email"]').val(),
    password: $('#signup-form input[name="password"]').val(),
    password_confirmation: $('#signup-form input[name="password_confirmation"]').val()
  }).then(function(user){
    console.log(user)
    window.location.href = "/bookmarks";
  }).fail(function(resp){
    console.log(resp)
  });
});

  $('#signin-form').on('submit', function(e){
    e.preventDefault();

  $.auth.emailSignIn({
    email: $('#signin-form input[name="email"]').val(),
    password: $('#signin-form input[name="password"]').val(),
  }).then(function(user){
    console.log(user)
    window.location.href = "/bookmarks";
    console.log(user)
  }).fail(function(resp){
    console.log(resp)
  });
});




});