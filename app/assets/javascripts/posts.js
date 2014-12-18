$(function() {
	if($('#post_form').length > 0){
		setAddFileListener();
		setRemoveFileListener();
	}
	if($('#edit_photos').length > 0){
		setRemovePhotoListener();
		setHeaderPhotoListener();
	}
});

function setAddFileListener(){
	var $file_field = $(".file_field_container");
	$('#add_file_field').on('click', function(){
		var $cloned_file_field = $file_field.clone();
		var timestamp = new Date().getTime();
		$cloned_file_field.find('input').attr('name', 'post[photos_attributes]['+timestamp+'][image_file]');
		$(this).before($cloned_file_field);
		setRemoveFileListener();
		return false;
	});
}

function setHeaderPhotoListener(){
  var $checkboxes = $('input[type="checkbox"]');
	$checkboxes.on('change', function(e){
		var $selected = $(this);
		if($selected.prop('checked')){
			toggleCheckboxes($checkboxes, $selected);
		}
	});
}

function toggleCheckboxes($checkboxes, $selected){
	$checkboxes.attr('checked',false);
	$selected.attr('checked',true);
}

function setRemoveFileListener(){
	var $file_fields = $('input[type="file"]');
	$('.remove_file').on('click', function(e){
		e.preventDefault();
		var $file_container = $(this).parent();
		if($file_fields.length == 1){
			$file_container.replaceWith($file_container.clone());
		}else{
			$file_container.remove();
		}
		setRemoveFileListener();
		return false;
	});
}

function setRemovePhotoListener(){
	$('.destroy_photo').on('click', function(){
		var $icon = $(this);
		var $thumbnail_wrapper = $icon.parent();
		var $hidden_field = $icon.next("input[type='hidden']");
		toggleHiddenFieldValue($hidden_field);
		toggleBackgroundColor($thumbnail_wrapper);
  });
}

function toggleHiddenFieldValue(field){
	parseInt(field.val()) ? field.val(0) : field.val(1);
}

function toggleBackgroundColor(wrapper){
	var color = 'rgba(255,3,13,0.5)';
	if(wrapper.css('background-color') == color){
    wrapper.css('background-color', '');			
	}else{
    wrapper.css('background-color', color);		
	}
}
