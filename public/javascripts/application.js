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

  $('#add_user').click(function(e){
    e.preventDefault();
    var child = $('#user_list').children().last().clone();
    var new_id = $('#user_list').children().length;
    child.find('label').attr('for', 'category_users_attributes_'+new_id+'_id');
    child.find('select').attr('id', 'category_users_attributes_'+new_id+'_id');
    child.find('select').attr('name', 'category[users_attributes]['+new_id+'][id]');
    child.find('.remove_user').show();
    child.find('#add_user').remove();
    $('#user_list').append(child);
  });

  $('.remove_user').live('click', function(e){
    e.preventDefault();
    $(this).parent().remove();
  });

  $('ul.scopes li').click(function(){
    var parent_id = $(this).parent().attr('id').replace('scope_for_', '');
    var id = $(this).attr('id');
    
    $(this).toggleClass('checked');
    if($(this).hasClass('checked')){
      $('#tasks_'+parent_id+' li.'+id).fadeIn();
    }
    else{
      $('#tasks_'+parent_id+' li.'+id).fadeOut();
    }
  });
});