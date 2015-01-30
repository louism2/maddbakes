$(function() {
	
	if($('.destroy_photo').length > 0){
		setRemovePhotoListener();
		setHeaderPhotoListener();
	}
	
});

function setRemovePhotoListener(){
	$('.destroy_photo').on('click', function(){
		var $icon = $(this);
		var $thumbnail_wrapper = $icon.parent();
		toggleBackgroundColor($thumbnail_wrapper);
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