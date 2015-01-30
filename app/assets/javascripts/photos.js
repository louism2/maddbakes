$(function() {
	
	if($('.destroy_photo').length > 0){
		window.edited_photos = {deleted_photos:[],cover_photos:[],header_photos:[]}
		setDestroyPhotoListener();
	}
	
});

function setDestroyPhotoListener(){
	$('.destroy_photo').on('click', function(){
		var $wrapper = $(this).closest('.thumbnail_wrapper');
		var $hidden_field = $(this).next('.destroy_photo_hidden_field');
		toggleThumbnailBackground($wrapper);
		toggleHiddenFieldValue($hidden_field);
	});
}

function toggleThumbnailBackground($wrapper){
	if($wrapper.css('background-color') != 'rgba(0, 0, 0, 0)'){
		$wrapper.removeClass('deleted');
	}else{
		$wrapper.addClass('deleted');
	}
}

function toggleHiddenFieldValue(field){
	field.val() === 'true' ? field.val('false') : field.val('true');
}

function toggleBackgroundColor(wrapper){
	var color = 'rgba(255,3,13,0.5)';
	if(wrapper.css('background-color') == color){
    wrapper.css('background-color', '');			
	}else{
    wrapper.css('background-color', color);		
	}
}