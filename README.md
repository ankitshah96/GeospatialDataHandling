# GeospatialDataHandling
# 1. Google Map Visualization
  Contains 13 locations in KML file for Geospatial Visualization and a snip of the Visualization of locations on Google Earth.
# 2. OpenLayers Visualization
  Using OpenLayers (a JavaScript API) we can visualize our location data. The idea is to store the 13 sampled points, via the web browser, in a browser cache area in your local 
  machine, where the data would persist [even after you close the browser]; then you'd read back the stored values, and visualize them, using the OpenLayers API. 
  To store and load points, you'll use 'HTML5 localStorage', which is a key-value based standard WWW API.
  To store the points we can use setItem method of Storage interface.
  The setItem() method of the Storage interface, when passed a key name and value, will add that key to the given Storage object, or update that key's value if it already exists.
  
  Syntax:
  ```
   localStorage.setItem("myData",JSON.stringify(locations)); // Locations can be a json object
  ```
  
  To retrieve locations from localStorage we can use getItem method of Storage interface. The getItem() method of the Storage interface, when passed a key name, will return 
  that key's value, or null if the key does not exist, in the given Storage object.
  
  Syntax:
  ```
   var dataStored = JSON.parse(localStorage.getItem("myData"));
  ```

Following is the function for plotting points on map:

```
  function initMap() {
          map = new OpenLayers.Map('map');
          basemap = new OpenLayers.Layer.OSM("Simple OSM Map");
          map.addLayer(basemap);
          markers = new OpenLayers.Layer.Markers("Markers");
          map.addLayer(markers);
  }

  function addMarker(latitude, longitude) {
          var lonLat = new OpenLayers.LonLat(longitude, latitude)
              .transform(
                  new OpenLayers.Projection("EPSG:4326"), // transform from WGS 1984
                  map.getProjectionObject() // to Spherical Mercator Projection
          );
          var point = new OpenLayers.Marker(lonLat);
          markers.addMarker(point);
          map.setCenter(lonLat, 8); // second arg is zoom level
          //console.log(latitude + ", " + longitude);
  }


  // load and setup map layers
  initMap();

  // here's how to plot points on the map! 
  for(let i in d)
  {
      addMarker(d[i][0]["a"],d[i][0]["b"]);
  }

```

# 3. Spatial Queries for Geospatial operations
  Contains query for finding Convex Hull and Nearest Neighbour from home location using PostGIS and PostgreSQL.
  
# 4. Spirograph Visualization
   I have converted the KML to an ESRI 'shapefile' and visualized the shapefile data using ArcGIS Online. To convert your .kml into a shapefile, I have used 
   https://mygeodata.cloud/converter/kml-to-shp - the result will be a .zip [which is what we call 'shapefile'], which will contain within it, shape data (.shp), a relational 
   table (.dbf), and other optional files (.shx, .prj, .cpg).
   Then I have uploaded shapefile to the ArcGIS' online map creator to view the Spirograph curve-shaped points.
   
   For the Spirograph curve point creation, I have used the following parametric equations (with R=8, r=1, a=4):
   
  ```
    x(t) = (R+r)*cos((r/R)*t) - a*cos((1+r/R)*t)
    y(t) = (R+r)*sin((r/R)*t) - a*sin((1+r/R)*t)
   ```
   
  
   
   
