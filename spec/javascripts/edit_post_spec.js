describe('Edit Post', function(){
  
  describe('Edit Photos Partial', function(){
    describe('destroying a photo', function(){
      
			describe('clicking the remove icon once', function(){
        
        it('marks a photo for destruction when you click icon', function(){
          loadFixtures('edit_photos.html');  
          setRemovePhotoListener();
          var $icon = $('.destroy_photo').eq(0);
          $icon.click()
          expect($icon.next("input[type='hidden']").val()).toEqual("1"); 
        });
      
        it('adds a red background to the thumbnail wrapper', function(){
          loadFixtures('edit_photos.html');  
          setRemovePhotoListener();
          var $icon = $('.destroy_photo').eq(0);
          var $wrapper = $icon.parent();
          var initial_color = $wrapper.css('background-color');
          $icon.click();
          expect($wrapper.css('background-color')).not.toEqual(initial_color);
        });       
      
      });
      
      describe('clicking the remove icon twice', function(){
        
        it('unmarks a photo for destruction if the icon is clicked twice', function(){
          loadFixtures('edit_photos.html');  
          setRemovePhotoListener();
          var $icon = $('.destroy_photo').eq(0);
          $icon.click().click();
          expect($icon.next("input[type='hidden']").val()).toEqual("0"); 
        });
      
        it('removes the red background if the icon', function(){
          loadFixtures('edit_photos.html');  
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
      
		describe('setHeaderPhotoListener()', function(){

			describe('marking the check box', function(){

				beforeEach(function(){
					loadFixtures('edit_photos.html');
				})

				it('calls the method', function(){
					var spy = spyOn(window, 'setHeaderPhotoListener').and.callThrough();
					setHeaderPhotoListener();
					var $unchecked = $('input[type="checkbox"]:not(:checked)');
					$unchecked.prop('checked', true);
					expect(spy).toHaveBeenCalled();
				});

			});

		});
		
		describe('toggleCheckboxes()', function(){
			
			beforeEach(function(){
				loadFixtures('edit_photos.html');  
				setHeaderPhotoListener();
			})
			
			describe('marking the check box', function(){
				it('calls the method', function(){
					var spy = spyOn(window,'toggleCheckboxes').and.callThrough();
				  var $unchecked = $('input[type="checkbox"]:not(:checked)');	
					$unchecked.trigger('click');
					expect(spy).toHaveBeenCalled();
				});
				
				it('unchecks the previous photo and checks the new photo', function(){
				  var $checked = $('input[type="checkbox"]:checked');	
					var $unchecked = $('input[type="checkbox"]:not(:checked)');	
					$unchecked.trigger('click');
					expect($checked.prop('checked')).toEqual(false);	
				});
			});
			
			describe('when unchecking a photo', function(){
				it('does not call the method', function(){
					var spy = spyOn(window,'toggleCheckboxes').and.callThrough();
				  var $checked = $('input[type="checkbox"]:checked');
					$checked.trigger('click');
					expect(spy).not.toHaveBeenCalled();
				});
			});
			
		});	
		
	});

});
