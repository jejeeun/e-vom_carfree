/* 달력 */
$(function() {
	 $(".calendar").datepicker({
		changeMonth:true, 
		changeYear:true,
		nextText:'다음 달',
		prevText:'이전 달' 
	});
});

/* 팜업 */
function openPopup() {
	location.href="#popup_slide"
	$("#popup_slide").show();
}
function closePopup() {
	$("#popup_slide").hide();
}

/* 팝업 슬라이드 */
(function() {

	(function() {
		var arrowLeft, arrowRight, currentImg, initSlider, resetSlider, sliderBox, toLeft, toRight;

		sliderBox = document.querySelectorAll('.slide_wrap');
		arrowLeft = document.querySelector('.left-arrow');
		arrowRight = document.querySelector('.right-arrow');
		currentImg = 0;
	
		initSlider = function() {
			resetSlider();
			sliderBox[0].style.display = 'block';
		};
		resetSlider = function() {
			var i;
			i = 0;

			while (i < sliderBox.length) {
				sliderBox[i].style.display = 'none';
				i++;
			}
		};
		toLeft = function() {
			resetSlider();
			sliderBox[currentImg - 1].style.display = 'block';
			currentImg--;
		};
		toRight = function() {
			resetSlider();
			sliderBox[currentImg + 1].style.display = 'block';
			currentImg++;
		};
		arrowLeft.addEventListener('click', function() {
			if (currentImg === 0) {
				currentImg = sliderBox.length;
			}
			toLeft();
		});
		arrowRight.addEventListener('click', function() {
			if (currentImg === sliderBox.length - 1) {
				currentImg = -1;
			}
			toRight();
		});
		initSlider();
	})();

}).call(this);