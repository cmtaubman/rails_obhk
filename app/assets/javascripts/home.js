// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function () {
  var bindFilterButton = function () {
    $('#filter-button').off().on("click", function (e) {
      e.preventDefault();
      console.log("clicked");
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

  // $.auth
  // .oAuthSignIn({provider: 'github'})
  // .then(function(user) {
  //   alert('Welcome ' + user.name + '!');
  // })
  // .fail(function(resp) {
  //   alert('Authentication failure: ' + resp.errors.join(' '));
  // });

  $('#signup-form').on('submit', function(){
  $.auth.emailSignUp({
    email: $('#signup-form input[name="email"]').val(),
    password: $('#signup-form input[name="password"]').val(),
    password_confirmation: $('#signup-form input[name="password_confirmation"]').val()
  }).then(function(user){
    alert('Welcome ' + user.email + '!');
    window.location.href = "/bookmarks";
  }).fail(function(resp){
    alert('Authentication failure: ' + resp.errors.join(' '));
  });
});

  $('#signin-form').on('submit', function(){
  $.auth.emailSignIn({
    email: $('#signin-form input[name="email"]').val(),
    password: $('#signin-form input[name="password"]').val(),
  }).then(function(user){
    alert('Welcome ' + user.email + '!');
    window.location.href = "/bookmarks";
    console.log(user)
  }).fail(function(resp){
    alert('Authentication failure: ' + resp.errors.join(' '));
  });
});




});