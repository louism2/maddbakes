$(document).ready(function(){
	if($('#container').length > 0){
		
		$window = $(window);
		$body = $('body');
		
		var INITIAL_STYLE = {position: 'absolute', visibility: 'hidden', width: $window.width()};
		
		var image_arr = [];
		var image_array = ['images/de_la.jpg','images/pete.jpg','images/tribe.jpg'];
		var left_image_index = 0;
		var image_decrement = 22;
		var tallestImageHeight = 0;
		var em_height = setEmHeight();
		
		var $container = $('#container');
		var $container_buffer = $('#container_buffer');
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
			$right_image.css({visibility: 'visible', left: $window.width()});
		}

		function slideThemShits(){
			var left_image_offset  = $left_image.offset().left;
			var right_image_offset = $right_image.offset().left;

			if(right_image_offset > 0){
				$left_image.offset({left: left_image_offset-image_decrement});
				$right_image.offset({left: right_image_offset-image_decrement});
				setTimeout(slideThemShits,40);
			}else{
				$right_image.offset({left: 0});
				$left_image.css({visibility: 'hidden'});
				left_image_index == image_arr.length-1 ? left_image_index = 0 : left_image_index++;
			}
		}

		function insertImages(){
			for(var x=0;x<image_array.length;x++){
				var image = new Image();
				image.onload = function() {
					var $orig_img = $(this);
					var $full_img = $orig_img.clone().css(INITIAL_STYLE).addClass('banner_image');
					if($('.banner_image').length < 1){
						$full_img.css({visibility: 'visible'});	
					}
					$full_img.appendTo($container).css({width: '100%'});
					setContainerHeight();
					image_arr.push($full_img)
				}
				image.src = image_array[x];
			}
		}

		$window.resize(function(){
		  em_height = setEmHeight();
			setContainerHeight();
		});

		function setEmHeight(){
			return $window.width() / parseFloat($body.css("font-size"));
		}
		
		function emMultiplier(factor){
			return em_height*factor
		}
		
		function setContainerHeight(){
			tallestImageHeight = 0;
			$('.banner_image').each(function(index){
				var height = $(this).height();
				setTallestImageHeight(height);
			});
			$container.css({height: tallestImageHeight});
			$container_buffer.css({height: tallestImageHeight+emMultiplier(2)});
		}
		
		function setTallestImageHeight(height){
			if(height > tallestImageHeight){
				tallestImageHeight = height;
			}
		}

	} // end if container
});	

	