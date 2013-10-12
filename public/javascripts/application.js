// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function get_browser() {
	var ua = navigator.userAgent.toLowerCase();
	var browsers = new Array('msie', 'firefox', 'safari', 'omniweb', 'icab', 'webtv');
	for (var i = 0; i < browsers.length; i++) {
		if (ua.indexOf(browsers[i]) + 1) {
			return browsers[i];
		}
	}
}

function swap_image(small_image) {
	other_images = document.getElementsByClassName('small-image');
	for (var i = 0; i < other_images.length; i++) {
		Element.removeClassName(other_images[i], 'active');
	}
	Element.addClassName(small_image, 'active');
	$('large-image').src = small_image.src.replace('small', 'large');
}
