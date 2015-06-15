
<div class="map-canvas-inside">
<h1 style="background-color: orange">Sign up now!</h1>


<%= link_to "I'm a Student", signup_path, :class => "btn btn-lg btn-block"%><br>
<%= link_to "I'm a Tutor", signup_path, :class => "btn btn-lg btn-block"%>
</div>


<div id='map-canvas'> 
<button onclick="getLocation()" class="btn btn-lg btn-block">See Scholars in your area!</button>



</div>


<script>
var x = [];
var y = []
var latitude;
var longitude;
var xmlhttp = new XMLHttpRequest();
var url = "http://localhost:3000/users.json";
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
	
	//x.innerHTML = "Latitude: " + latitude + "<br>Longitude: " + longitude + "<br>" + url;
	
	google.maps.event.addDomListener(window, 'load', initialize(latitude, longitude));
}

xmlhttp.open("GET", url, true);
xmlhttp.send();

xmlhttp.onreadystatechange = function() {
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		myFunction(xmlhttp.responseText);
	}
}

function myFunction(response) {
	var data = JSON.parse(response);
    var lat = "sad";
    var longitude = ""; 
    for (var i=0; i<data.user.length; i++)
    {
    lat = data.user[i].lat;
    longitude = data.user[i].long;
	x.push(lat)
	y.push(longitude)
}
	
}
	

function initialize(latitude, longitude){
	var mapCanvas = document.getElementById('map-canvas');
	var mapOptions = {
		center: new google.maps.LatLng(latitude, longitude),
		zoom: 13,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		panControl: false,
        zoomControl: false,
        scaleControl: false,
        scrollwheel: false
	}
	var map = new google.maps.Map(mapCanvas, mapOptions);

	var marker, i;
	for(i=0; i<x.length; i++) {
		marker= new google.maps.Marker({
		position: new google.maps.LatLng(x[i], y[i]),
		map: map
	});
	}

	var userMarker = new google.maps.Marker({
		position: mapOptions.center,
		map: map,
		title: 'You are here'
	});


	var infowindow = new google.maps.InfoWindow({
		content: "You are here!"
	});

	google.maps.event.addListener(userMarker, 'click', function() {
		infowindow.open(map, userMarker);
	});
}



	




</script>