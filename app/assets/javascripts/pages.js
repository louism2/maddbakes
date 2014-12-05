$(document).ready(function(){
	if($('#container').length > 0){
		var INITIAL_STYLE = {position: 'absolute', visibility: 'hidden', width: '80%', height: 'auto', left: '10%'};
		var MAX_IMAGE_WIDTH = 700;
		
		$window = $(window);

		var image_arr = [];
		var image_array = ['images/de_la.jpg','images/pete.jpg','images/tribe.jpg'];
		var left_image_index = 0;
		var image_decrement = 12;
		var tallestImageHeight = 0;
		
		var $container = $('#container');
		var $pane = $('.pane');
		var $pane_left = $('#pane_left');

		var $left_image;
		var $right_image;

		insertImages();
		rotateImages();

		function rotateImages(){
			if(image_arr.length > 1){
				setImageVariables();
				slideThemShits();
			}
			setTimeout(rotateImages, 8000);
		}

		function setImageVariables(){
			$left_image = $(image_arr[left_image_index]);
			if(left_image_index < image_arr.length-1){
				$right_image = $(image_arr[left_image_index+1]);
			}else{
				$right_image = $(image_arr[0]);
			}
			var imageStart = $('.pane').filter('#pane_right').offset().left
			$right_image.css({visibility: 'visible', left: imageStart});
		}

		function slideThemShits(){
			var left_image_offset  = $left_image.offset().left;
			var right_image_offset = $right_image.offset().left;

			if(right_image_offset > $pane_left.width()){
				$left_image.offset({left: left_image_offset-image_decrement});
				$right_image.offset({left: right_image_offset-image_decrement});
				setTimeout(slideThemShits,40);
			}else{
				$right_image.offset({left: $pane_left.width()});
				$left_image.css({visibility: 'hidden'});
				left_image_index == image_arr.length-1 ? left_image_index = 0 : left_image_index++;
			}
		}

		window.rotate = rotateImages;

		function insertImages(){
			for(var x=0;x<image_array.length;x++){
				var image = new Image();
				image.onload = function() {
					var $orig_img = $(this);
					var $full_img = $orig_img.clone().css(INITIAL_STYLE).addClass('banner_image');
					if($('img').length < 1){
						$full_img.css({visibility: 'visible'});	
					}
				    $pane_left.before($full_img);
					$window.trigger('resize');
					setPaneHeight();
					image_arr.push($full_img)
				}
				image.src = image_array[x];
			}
		}

		$window.resize(function(){
			setPaneHeight();
			if(bannerImageAtMaxWidth()){
				var paneWidth = getComputedPaneWidth();		
				$pane.css({width: paneWidth}).filter('#pane_right').css({left: paneWidth+MAX_IMAGE_WIDTH});
				$('.banner_image').filter(':visible').css({left: paneWidth+'px'})
			}else{
				$('.banner_image').filter(':visible').css({left: '', width: '80%'});
				$pane.css({width: '10%'}).filter('#pane_right').css({left: '', right: 0});
			}
		});

		function bannerImageAtMaxWidth(){
			return $('.banner_image').filter(':visible').width() == MAX_IMAGE_WIDTH ? true : false;
		}

		function getComputedPaneWidth(){
			return ($window.width()-MAX_IMAGE_WIDTH)/2;
		}
		
		function setPaneHeight(){
			tallestImageHeight = 0;
			$('.banner_image').each(function(index){
				var height = $(this).height();
				setTallestImageHeight(height);
			});
			$container.css({height: tallestImageHeight});
			$pane.css({height: tallestImageHeight});
		}
		
		function setTallestImageHeight(height){
			if(height > tallestImageHeight){
				tallestImageHeight = height;
			}
		}

	} // end if container
});	

	