describe('New Comment', function(){
	describe('monitorTextArea()', function(){
		
		var $comment_area;
		var $text_count;
		var $submit_button;
		
		beforeEach(function(){
		  loadFixtures('comment_form.html');	
			$comment_area = $('#comment_content');
			$text_count = $('#text_count');
			$submit_button = $('input[type="submit"]');
			monitorTextArea($comment_area, $text_count);
			drawCharacterCount($comment_area, $text_count, $submit_button);
		});
		
		describe('when #comment_content gains focus', function(){
			it('displays the #text_count span', function(){
        $text_count.css('visibility','visible');
				$comment_area.trigger('focus');
				expect($text_count.css('visibility')).toEqual('visible');
			});
			it('updates the count inside of #text_count', function(){
			  $comment_area.text('test').trigger('keyup');
				expect($text_count.text()).toEqual('496 characters remaining')
			});
			
			
			describe('more than 500 characters of text', function(){
				it('disables the submit button', function(){
					$comment_area.text(new Array(502).join('a'));
					$comment_area.trigger('keyup');
					expect($submit_button.prop('disabled')).toEqual(true);	
				});
				it('changes the text color to red', function(){
					$comment_area.text(new Array(502).join('a'));
					$comment_area.trigger('keyup');
					expect($text_count.css('color')).toEqual('rgb(255, 0, 0)')
				});
			});
		});
		
		describe('when #comment_content loses focus', function(){
			describe('more than 500 characters of text', function(){
				it('leaves the #text_count span visible', function(){
					$comment_area.trigger('focus');
					$comment_area.val(new Array(502).join('a'));
					$comment_area.trigger('blur');
					expect($text_count.css('visibility')).toEqual('visible');
				});
				it('disables the submit_button', function(){
					$comment_area.trigger('focus');
					$comment_area.val(new Array(502).join('a'));
					$comment_area.trigger('keyup');
					$comment_area.trigger('blur');
					expect($submit_button.prop('disabled')).toEqual(true);					
				});
			});
			
			describe('less than 500 characters of text', function(){
				it('hides the #text_count span', function(){
					$comment_area.trigger('focus');
					$comment_area.val('test');
					$comment_area.trigger('blur');
					expect($text_count.css('visibility')).toEqual('hidden');
				});
			});
	  });	
	
	});
});