

import GMaps from 'gmaps/gmaps.js';
// this is for map stuff required only on specific pages (purpose of the differente packs)
const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 51.75, lng: -1.26 });
  const markers = JSON.parse(mapElement.dataset.markers);
  console.log(markers)

  markers.forEach((marker) => {
    map.addMarker({
      lat: marker.lat,
      lng: marker.lng,
      infoWindow: {
        content: marker.infowindow
      }
    });
  });

  if (markers.length < 1) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}




//{
  // var marker = new google.maps.Marker()
    //const infowindow = new google.maps.InfoWindow({
      //content: marker.card
   // });
    //marker.addEventListener('click', function() {
     // infowindow.open(map, marker);
    //});
