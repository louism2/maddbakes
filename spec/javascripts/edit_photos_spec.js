describe('Edit Photos', function(){

  describe('setDestroyPhotoListener()', function(){

		beforeEach(function(){
			loadFixtures('photo_thumbnails.html');
		});

		describe('when the photo isn\'t currently marked for deletion', function(){

			it('the _destroy field is changed to true when the icon is clicked', function(){
				setDestroyPhotoListener();
				var $icon = $('.destroy_photo:first');
				$icon.trigger('click');
				expect($icon.next('.destroy_photo_hidden_field').val()).toEqual('true');
			});

			it('a red background is added to the thumbnail_wrapper when the icon is clicked', function(){
				setDestroyPhotoListener();
				var $icon = $('.destroy_photo:first')
				$icon.trigger('click');
				expect($icon.closest('.thumbnail_wrapper').css('background-color')).toEqual('rgba(176, 23, 31, 0)');
			});

		});
	
		describe('when the photo is currently marked for deletion', function(){

			it('the _destroy field is changed to false when the icon is clicked', function(){
				setDestroyPhotoListener();
				var $icon = $('.destroy_photo:last');
				$icon.trigger('click');
				expect($icon.next('.destroy_photo_hidden_field').val()).toEqual('false');
			});

			it('a red background is removed from the thumbnail_wrapper when clicked', function(){
				setDestroyPhotoListener();
				var $icon = $('.destroy_photo:last')
				$icon.trigger('click');
				expect($icon.closest('.thumbnail_wrapper').css('background-color')).toEqual('rgba(0, 0, 0, 0)');
			});

		});
	
	}); // end setDestroyPhotoListener()


});	