describe('Edit Post', function(){
	
	describe('Edit Photos Partial', function(){
	  describe('destroying a photo', function(){
			describe('clicking the remove icon once', function(){
				
				it('marks a photo for destruction when you click icon', function(){
			    loadFixtures('edit_photo_with_photos.html');	
			    setRemovePhotoListener();
					var $icon = $('.destroy_photo').eq(0);
					$icon.click()
					expect($icon.next("input[type='hidden']").val()).toEqual("1"); 
				});
			
				it('adds a red background to the thumbnail wrapper', function(){
			    loadFixtures('edit_photo_with_photos.html');	
			    setRemovePhotoListener();
					var $icon = $('.destroy_photo').eq(0);
					console.log($icon);
					var $wrapper = $icon.parent();
					var initial_color = $wrapper.css('background-color');
					$icon.click();
					console.log($wrapper)
					expect($wrapper.css('background-color')).not.toEqual(initial_color);
				});				
			
			});
	  	
			describe('clicking the remove icon twice', function(){
				
				it('unmarks a photo for destruction if the icon is clicked twice', function(){
			    loadFixtures('edit_photo_with_photos.html');	
			    setRemovePhotoListener();
					var $icon = $('.destroy_photo').eq(0);
					$icon.click().click();
					expect($icon.next("input[type='hidden']").val()).toEqual("0"); 
				});
			
				it('removes the red background if the icon', function(){
			    loadFixtures('edit_photo_with_photos.html');	
			    setRemovePhotoListener();
					var $icon = $('.destroy_photo').eq(0);
					var $wrapper = $icon.parent();
					$icon.click();
					var initial_color = $wrapper.css('background-color');
					$icon.click();
					expect($wrapper.css('background-color')).toEqual(initial_color);
				});				
				
			});	
			
			

			
	  });
  });

});
