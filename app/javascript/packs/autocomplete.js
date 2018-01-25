console.log('hello from autocomplete pack');
  document.addEventListener("DOMContentLoaded", function() {
    var resourceAddress = document.getElementById('resource_address');

    if (resourceAddress) {
      var autocomplete = new google.maps.places.Autocomplete(resourceAddress, { types: [ 'geocode' ] });
      console.log(autocomplete)
      google.maps.event.addDomListener(resourceAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });

  document.addEventListener("DOMContentLoaded", function() {
    var resourceAddress = document.getElementById('event_address');

    if (resourceAddress) {
      var autocomplete = new google.maps.places.Autocomplete(resourceAddress, { types: [ 'geocode' ] });
      console.log(autocomplete)
      google.maps.event.addDomListener(resourceAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
