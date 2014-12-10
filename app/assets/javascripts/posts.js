$(function() {
	if($('#post_form').length > 0){
		setAddFileListener();
		setRemoveFileListener();
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