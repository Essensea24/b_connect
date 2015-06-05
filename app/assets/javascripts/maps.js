// to initiate initialize function when the window load
google.maps.event.addDomListener(window, 'load', initialize_map);
google.maps.event.addDomListener(window, 'page:load', initialize_map);

// function initialize_map() {
// 	 var mapProperties = {
// 	        center: new google.maps.LatLng(34, -118),
// 	        zoom: 15,
// 	        mapTypeId: google.maps.MapTypeId.ROADMAP
//    	 }

// 	var my_map = new google.maps.Map(document.getElementById("address-map"), mapProperties);
  
// 	  navigator.geolocation.getCurrentPosition(function(res){
	        
// 	        //res now represents the user's location info
// 	        console.log("Location info: ", res);
	        
// 	        //Create coord
// 	        var c = new google.maps.LatLng(res.coords.latitude, res.coords.longitude);
	        
// 	        my_map.setCenter(c);

// 	        var marker = new google.maps.Marker({
//         		position: c
//      		})
//     		marker.setMap(my_map);
// 	  	})

  

// }

function initialize_map() {

    // Find the map DIV (if it exists)
    var el = document.getElementById('address-map')

    // Bail out if there's not an address map on the page
    if(!el) return

    // Get an instance of the geocoder
    var geocoder = new google.maps.Geocoder()

    // Get the page's marker data from the JSON API
    var url = window.location.origin + window.location.pathname + ".json"

    // Ajax the data URL (this retrieves the contents of that JSON url above)
    $.get(url, function(results){

        console.log("Data returned from " + url, results)

        // Wrap the data in an array if it's not one already
        if(!(results instanceof Array)) results = [results]

        // Perform geocoding for all addresses using promises to coordinate the results
        var geo_promises = []

        // Geocode each address to be displayed
        // Realistically, this should be done in the Model when data is saved
        for(var i = 0; i < results.length; i++){
            console.log("for loop 1")

            // This creates promises using the jQuery Deferred library
            var promise = $.Deferred(function(deferred){
                geocoder.geocode({'address': results[i].country}, function(geo_results, status){
                            console.log("2")
                    deferred.resolve(geo_results)
                })
            })
            geo_promises.push(promise)

        }

        // Dispatch the promises
        Promise.all(geo_promises).then(function(promise_results){
            console.log("3")
            // Create a map
            var mapProps = {
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }
            var map = new google.maps.Map(el, mapProps)

            // Bounds are cool because they center our map for us
            var bounds = new google.maps.LatLngBounds()

            // Track an array of our markers
            var markers = []

            // Loop over the promise results
            for(var i = 0; i < promise_results.length; i++){
                console.log("for loop 2")

                var  promise_result = promise_results[i][0]

                // result now represents a single geocoded address
                var coord = promise_result.geometry.location

                // Create and place a marker
                var marker = new google.maps.Marker({position: coord})
                marker.setMap(map)
                markers.push(marker)

                // Add the coordinates to the bounds (so we can center the map)
                bounds.extend(coord)

                // Create an info window
                var infowindow = new google.maps.InfoWindow({
                    content: "<h1>" + results[i].country + "</h1>" + results[i].description
                })

                // Open it above the marker
                infowindow.open(map, markers[i])

            }

            // Center and fit the map using the bounds
            map.fitBounds(bounds)

        })

    })

}
