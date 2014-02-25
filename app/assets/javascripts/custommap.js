/*
* Alex Nunes
* RecNS WanderStream
* 02/10/2014
*/

//Geolocation Prompt
  if(navigator.geolocation) {
    browserSupportFlag = true;
    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      map.setCenter(initialLocation);
    }, function() {
      handleNoGeolocation(browserSupportFlag);
    });
  }




/*Create marker points 2D array to hold name, latitude, and longitude.
Pulled by Google maps to create markers and infowindow content. Information
gathered from html tables generated by search.*/
var markerpoints= [];

$(document).ready(function(){


$('table > tbody > tr').each(function(){
  var name= $('.name', this).text();
  var lat= $('.lat', this).text();
  var lng= $('.lng', this).text();
  var id= $(this).attr('id');
  markerpoints.push([name, lat, lng, id]);
});
});

//Function initializing the map
function initialize() {
  var myLatlng = new google.maps.LatLng(45.000, -63.000);
  var mapOptions = {
    zoom: 8,
    center: myLatlng
  };

//Create new map
var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  

 
//Loops through all of markerpoints array
for(var i=0; i<markerpoints.length; i++){

  

//Get latitude and longitude for each marker
	var markerLatlng= new google.maps.LatLng(markerpoints[i][1], markerpoints[i][2]);

//Create new marker for each iteration
	var marker = new google.maps.Marker({
      position: markerLatlng,
      map: map
  	});
  


//Creates an inforwindow for each iteration of the loop, setting content and open function
  var infowindow = new google.maps.InfoWindow();
    google.maps.event.addListener(marker, 'mouseover', (function(marker, i) {
      return function(){
        infowindow.setContent(markerpoints[i][0]);
        infowindow.open(map,marker);
        $('#' + (markerpoints[i][3])).mouseover(function(){
    google.maps.event.trigger(marker, 'mouseover');});
      }

    })(marker, i));



  
  //Function to prvent multiple windows
  google.maps.event.addListener(marker, 'mouseout', (function(marker, i) {
      return function(){
        infowindow.close();}}));


  
}



}

//Launch map
google.maps.event.addDomListener(window, 'load', initialize);




//End