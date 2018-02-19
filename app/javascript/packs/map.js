const baseOpacity = 0.7;
const activeOpacity = 1.0;

import GMaps from 'gmaps/gmaps.js';
// this is for map stuff required only on specific pages (purpose of the differente packs)
const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 51.75, lng: -1.26 });
  const markers = JSON.parse(mapElement.dataset.markers);
  const marker_array = [];
  markers.forEach((marker) => {
    let m = map.createMarker({
      lat: marker.lat,
      lng: marker.lng,
      infoWindow: {
        content: marker.infowindow
      },
      opacity: baseOpacity,
      click: () => {
        map.setZoom(14);
        map.setCenter(marker.lat, marker.lng);
      }
    });
    map.addMarker(m);
    marker_array.push(m);
  });


  const container = document.getElementById('list');
  container.addEventListener("mouseover", (event) => {
    marker_array.forEach((marker) => {
      marker.setOpacity(baseOpacity)
    })
    const card = event.target.closest('.resource-card');
    if (card === null) {
      return
    }
    const activeLat = parseFloat(parseFloat(card.dataset.lat).toFixed(7));
    const activeLng = parseFloat(parseFloat(card.dataset.lng).toFixed(7));
    let activeMarker = marker_array.find((marker) => {
      console.log(parseFloat(marker.position.lat().toFixed(7)) === activeLat && parseFloat(marker.position.lng().toFixed(7)) === activeLng)
      return parseFloat(marker.position.lat().toFixed(7)) === activeLat && parseFloat(marker.position.lng().toFixed(7)) === activeLng;
    })
    if (activeMarker === undefined) {
      console.log(parseFloat(marker_array[0].position.lat().toFixed(7)) === activeLat);
      console.log(parseFloat(marker_array[0].position.lng().toFixed(7)) === activeLng);
      console.log(activeMarker);
      return
    }
    console.log("hello")
    console.log(activeMarker.opacity);
    activeMarker.setOpacity(activeOpacity);


  });

  //         });
  //       } else {
  //         map.addMarker({
  //           lat: marker.lat,
  //           lng: marker.lng,
  //           infoWindow: {
  //             content: marker.infowindow
  //           },
  //           opacity: baseOpacity,
  //           click: () => {
  //             map.setZoom(14);
  //             map.setCenter(marker.lat, marker.lng);
  //           }
  //         });
  //       }
  //     });

  //   })
  // });

  // document.querySelectorAll(".resource-card").forEach((card) => {
  //   card.addEventListener("mouseout", (event) => {
  //     map.removeMarkers();
  //     markers.forEach((marker) => {
  //       map.addMarker({
  //         lat: marker.lat,
  //         lng: marker.lng,
  //         infoWindow: {
  //           content: marker.infowindow
  //         },
  //         opacity: baseOpacity,
  //         click: () => {
  //           map.setZoom(14);
  //           map.setCenter(marker.lat, marker.lng);
  //         }
  //       });
  //     })
  //   });
  // });

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
