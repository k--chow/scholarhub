
var x = document.getElementById('demo');
var y = document.getElementById('location');
var latitude;
var longitude;
var xmlhttp = new XMLHttpRequest();
var url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=";
function getLocation(){
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(showPosition);
	} 
	else 
	{
		x.innerHTML = "Not Supported.";
	}
}

function showPosition(position){
	latitude = position.coords.latitude;
	longitude = position.coords.longitude;
	url = url + latitude + "," + longitude;
	x.innerHTML = "Latitude: " + latitude + "<br>Longitude: " + longitude + "<br>" + url;
	xmlhttp.onreadystatechange = function() {
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		myFunction(xmlhttp.responseText);
	}
}
	xmlhttp.open("GET", url, true);
	xmlhttp.send();
	google.maps.event.addDomListener(window, 'load', initialize(latitude, longitude));
}

function initialize(latitude, longitude){
	var mapCanvas = document.getElementById('map-canvas');
	var mapOptions = {
		center: new google.maps.LatLng(latitude, longitude),
		zoom: 15,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	}
	var map = new google.maps.Map(mapCanvas, mapOptions);

	var marker = new google.maps.Marker({
		position: mapOptions.center,
		map: map,
		title: 'You are here'
		
	});

	var infowindow = new google.maps.InfoWindow({
		content: "You are here!"
	});

	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map, marker);
	});
}



function myFunction(response) {
	var arr = JSON.parse(response);
    var out = "";
    var end = 9;
    for (var i = 2; i<end; i++){
    out += arr.results[0].address_components[i].short_name;
    if (i === 8) 
    {
        out+= ".";
    }
    else {
        out+= ", ";
    }
	
}
	y.innerHTML = "Location: " + out;
}

