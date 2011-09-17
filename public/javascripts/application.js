$(document).ready(function(){
  $('#category_project_id').change(function(){
    $('#category_name').val($('#category_project_id option:selected').text());
  });

  if($('#category_color').length>0)
    $('#colorpicker').farbtastic('#category_color');

  if($('#user_lifetime').length > 0){
    $('#user_lifetime').change(function(){
      window.location = '?date='+$('#user_lifetime').val();
    });
  }
});