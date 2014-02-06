  if(navigator.geolocation) {
    browserSupportFlag = true;
    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      map.setCenter(initialLocation);
    }, function() {
      handleNoGeolocation(browserSupportFlag);
    });
  }

var markerpoints=[44.64850, -63.57566, 44.85704, -63.58930, 44.50392, -63.78921, 44.343523, -65.193912];


function initialize() {
  var myLatlng = new google.maps.LatLng(45.000, -63.000);
  var mapOptions = {
    zoom: 8,
    center: myLatlng
  };

var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  

 

for(var i=0; i<markerpoints.length; i+=2){


	var markerLatlng= new google.maps.LatLng(markerpoints[i], markerpoints[i+1]);

	var marker = new google.maps.Marker({
      position: markerLatlng,
      map: map,
      title:'Nova Scotia '+markerLatlng
  	});
  
  var contentString = '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<p>'+markerLatlng+'</p>'+
      '</div>'+
      '</div>';


    google.maps.event.addListener(marker, 'click', (function(marker, i) {
      return function(){
        var infowindow = new google.maps.InfoWindow({
      content: contentString});
      
      infowindow.open(map,marker);
      }
  })(marker, i));
}


}

  


google.maps.event.addDomListener(window, 'load', initialize);