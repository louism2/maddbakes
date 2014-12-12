describe('New Post', function(){
  
	describe('adding another file to the form', function(){
    
	    it('should add a file field when clicking "add file field"', function(){
	    	loadFixtures('post_form_one_file.html');
			setAddFileListener();
			$('#add_file_field').click();
			expect($('input[type="file"]').length).toEqual(2);
		});
	
		it('file fields should have different names', function(){
		    loadFixtures('post_form_one_file.html');
			setAddFileListener();
			$('#add_file_field').click();
			var $file_fields = $('input[type="file"]');
			expect($file_fields.eq(0).attr('name')).not.toEqual($file_fields.eq(1).attr('name'));		
		});
  
  	});

	describe('removing a file field', function(){
		describe('more than one file field present', function(){
			
			it('removes the file field', function(){
				loadFixtures('post_form_two_files.html');	
				setRemoveFileListener();				
				$('.remove_file').eq(1).click();
				expect($('input[type="file"]').length).toEqual(1);
			});
			
		});
		
		describe('only one file field present', function(){
			
			it('replaces the file_field', function(){
				loadFixtures('post_form_one_file.html');	
				var $beforeRemove = $('input[type="file"]');
				setRemoveFileListener();				
				$('.remove_file').click();
				var $afterRemove = $('input[type="file"]');
				expect($afterRemove).toBeInDOM();
				expect($afterRemove).not.toEqual($beforeRemove);
			});
			
		})
	});

	

});  