$(document).ready(function(){
  $('#user_lifetime').change(function(){
    window.location = '?date='+$('#user_lifetime').val();
  });
});