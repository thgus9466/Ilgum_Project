/**
 * 
 */
var container = document.getElementById('roadmap');
			var lat = document.getElementById('lat').value;
			var lng = document.getElementById('lng').value;
			var options = {
				center: new kakao.maps.LatLng(lat, lng),
				level: 3
			};

			var map = new kakao.maps.Map(container, options);