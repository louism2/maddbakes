describe('Post Form', function(){
  
  describe('adding another file to the form', function(){
    
    it('should add a file field when clicking "add file field"', function(){
    	loadFixtures('post_form.html');
		$('#add_file_field').click();
		expect($('input[type="file"]').length).toEqual(2);
	});
  
  });

});  