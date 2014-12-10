$(function() {
	console.log('here')
	if($('#post_form').length > 0){
		setAddFileListener();
		setRemoveFileListener();
	}
});

function setAddFileListener(){
	var $file_field = $("input[type='file']");
	$('#add_file_field').on('click', function(){
		var $cloned_file_field = $file_field.clone();
		var timestamp = new Date().getTime();
		$cloned_file_field.attr('name', 'post[photos_attributes]['+timestamp+'][image_file]');
		$(this).before($cloned_file_field);
	});
}

function setRemoveFileListener(){
	
}