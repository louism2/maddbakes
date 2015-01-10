$(document).ready(function(){
	if($('#comment_content').length){
		var $comment_area = $('#comment_content');
		var $text_count = $('#text_count');
		var $submit_button = $('input[type="submit"]');
		monitorTextArea($comment_area, $text_count);
		drawCharacterCount($comment_area, $text_count, $submit_button);
	}
});

function monitorTextArea($comment_area, $text_count){
	$comment_area.on('focus', function(){
		$text_count.css('visibility','visible');
	});
  $comment_area.on('blur', function(){
  	if(validCommentLength($comment_area)){
  	  $text_count.css('visibility','hidden');	
  	}
  })
}

function drawCharacterCount($comment_area, $text_count, $submit_button){
	$comment_area.on('keyup',function(){
		var characters_remaining = charactersRemaining($comment_area);
		var css_properties = buildCSS(characters_remaining)
		var message_text = buildMessage(characters_remaining);
		$text_count.text(message_text).css(css_properties);
		
		setButtonProperties($submit_button, characters_remaining)
	});
}

function buildCSS(length){
	if(length >= 0){
		return {color:'green'};
	}else{
		return {color:'red'};
	}
}

function setButtonProperties($submit_button,length){
	if(length >= 0){
	  $submit_button.removeAttr('disabled');
	}else{
		$submit_button.prop({disabled: 'true'});
	}
}

function buildMessage(length){
	if(length != 0){
		return length+' characters remaining';
	}else{
		return '1 character remaining';
	}
}

function validCommentLength($comment_area){
	var comment_limit = 500;
	return ((comment_limit - $comment_area.val().length) >= 0);
}

function charactersRemaining($comment_area){
	var comment_limit = 500;
	return (comment_limit - $comment_area.val().length);
}

function commentLength($comment_area){
	return $comment_area.val().length;
}


