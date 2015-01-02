$(document).ready(function(){
	if($('#comment_content').length){
		var $comment_area = $('#comment_content');
		var $comment_text_count = $('#text_count');
		$comment_area.focusin(function(){
			monitorCharacterCount();
		};
		
	}
	
});

function monitorCharacterCount(){
	$comment_area.on('change', function())
	$comment_text_count
}