  if(navigator.geolocation) {
    browserSupportFlag = true;
    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      map.setCenter(initialLocation);
    }, function() {
      handleNoGeolocation(browserSupportFlag);
    });
  }





var markerpoints= [];
$(document).ready(function(){


$('table > tbody > tr').each(function(){
  var name= $('.name', this).text();
  var lat= $('.lat', this).text();
  var lng= $('.long', this).text();
  markerpoints.push([name, lat, lng]);
});
});


function initialize() {
  var myLatlng = new google.maps.LatLng(45.000, -63.000);
  var mapOptions = {
    zoom: 8,
    center: myLatlng
  };

var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  

 

for(var i=0; i<markerpoints.length; i++){


	var markerLatlng= new google.maps.LatLng(markerpoints[i][1], markerpoints[i][2]);

	var marker = new google.maps.Marker({
      position: markerLatlng,
      map: map
  	});
  


  var infowindow = new google.maps.InfoWindow();
    google.maps.event.addListener(marker, 'mouseover', (function(marker, i) {
      return function(){
        infowindow.setContent(markerpoints[i][0]);
        infowindow.open(map,marker);
      }

  })(marker, i));
  
  google.maps.event.addListener(marker, 'mouseout', (function(marker, i) {
      return function(){
        infowindow.close();}}));


}



}


google.maps.event.addDomListener(window, 'load', initialize);




