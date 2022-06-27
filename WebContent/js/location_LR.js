

  var geocoder;

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(successFunction, errorFunction);
} 
//Get the latitude and the longitude;
function successFunction(position) {
    var lat = position.coords.latitude;
    var lng = position.coords.longitude;
    codeLatLng(lat, lng)
}

function errorFunction(){
    alert("Geocoder failed");
}

  function initialize_location_LR() {
    geocoder = new google.maps.Geocoder();



  }

  function codeLatLng(lat, lng) {

	    document.getElementById("lat_id").value  = lat;
		document.getElementById("lan_id").value  = lng;
		var latituide=$("#lat_id").val();
		var longituide=$("#lan_id").val();
	//	alert(latituide);
		$(document).ready(function () {
		$.post('Location_City',{latituide:latituide,longituide:longituide},  function(jsonResponse) {
///alert("============"+jsonResponse);


$("#city_location_LR").html(jsonResponse);
			

		});	
		});	
    /*var latlng = new google.maps.LatLng(lat, lng);
    geocoder.geocode({'latLng': latlng}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
      console.log(results)
        if (results[1]) {
         //formatted address
         
         
        var add= results[0].formatted_address
         var  value=add.split(",");

         count=value.length;
         country=value[count-1];
         state=value[count-2];
         city=value[count-3];
		//	alert(city);
        
			document.getElementById("city_location_LR").innerHTML = city;
			



        } else {
          alert("No results found");
        }
      } else {
        alert("Geocoder failed due to: " + status);
      }
    });*/
  }

