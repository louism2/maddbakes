$(function() {
	if($('.post_title').length > 0){
		var $post_title = $('.post_title');
		$post_title.hover(function(){
			$(this).css({'text-decoration':'underline'});
		})
		$post_title.mouseout(function(){
			$(this).css({'text-decoration':''});
		})
	}
	
	if($('.tab').length > 0){
	  setTabListener();	
	}
	
	if($('#post_form').length > 0){
		setAddFileListener();
		setRemoveFileListener();
	}
	
});

function setTabListener(){
	$('.tab').on('click', function(){
		var $clicked_tab = $(this);
		if(!$clicked_tab.hasClass('selected_tab')){
		  $('.tab').removeClass('selected_tab');
			$clicked_tab.addClass('selected_tab')	
			$('.photos_and_comments_wrapper').toggle();
		}
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


