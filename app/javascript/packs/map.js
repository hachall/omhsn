

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
      },
      opacity: 0.7,
      click: () => {
        map.setZoom(14);
        map.setCenter(marker.lat, marker.lng);
      }
    });
  });

  // add event listner to the hover of card
  console.log(document.querySelectorAll(".resource-card"))
  document.querySelectorAll(".resource-card").forEach((card) => {
    card.addEventListener("mouseover", (event) => {
      const activeLat = parseFloat(event.target.dataset.lat);
      const activeLng = parseFloat(event.target.dataset.lng);
      map.removeMarkers();
      markers.forEach((marker) => {

        if (marker.lat === activeLat && marker.lng === activeLng) {
          console.log("active");
          map.addMarker({
            lat: marker.lat,
            lng: marker.lng,
            infoWindow: {
              content: marker.infowindow
            },
            opacity: 1.0,
            click: () => {
              map.setZoom(14);
              map.setCenter(marker.lat, marker.lng);
            }
          });
        } else {
          map.addMarker({
            lat: marker.lat,
            lng: marker.lng,
            infoWindow: {
              content: marker.infowindow
            },
            opacity: 0.7,
            click: () => {
              map.setZoom(14);
              map.setCenter(marker.lat, marker.lng);
            }
          });
        }
      });

    })
  });

  document.querySelectorAll(".resource-card").forEach((card) => {
    card.addEventListener("mouseout", (event) => {
      map.removeMarkers();
      markers.forEach((marker) => {
        map.addMarker({
          lat: marker.lat,
          lng: marker.lng,
          infoWindow: {
            content: marker.infowindow
          },
          opacity: 0.5,
          click: () => {
            map.setZoom(14);
            map.setCenter(marker.lat, marker.lng);
          }
        });
      })
    });
  });

  // re-render all the makres with opactiy 0.3 excpe thte correcton with opacity 1



  if (markers.length < 1) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }

  const styles = [
    {
        "featureType": "landscape.natural",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#e0efef"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "hue": "#1900ff"
            },
            {
                "color": "#c0e8e8"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry",
        "stylers": [
            {
                "lightness": 100
            },
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "transit.line",
        "elementType": "geometry",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "lightness": 700
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "color": "#7dcdcd"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#00a5b7"
            }
        ]
    }
]
  map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
  });
  map.setStyle('map_style');

}



//{
  // var marker = new google.maps.Marker()
    //const infowindow = new google.maps.InfoWindow({
      //content: marker.card
   // });
    //marker.addEventListener('click', function() {
     // infowindow.open(map, marker);
    //});
