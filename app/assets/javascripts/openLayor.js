OpenLayer = {
  locations: null,
  vectorSource: null,

  init: function(locations){
    OpenLayer.locations = locations;
    OpenLayer.vectorSource = new ol.source.Vector();
    var vectorLayer = new ol.layer.Vector({
      source: this.vectorSource,
      style: this.markerStyle
    });

    var layer = new ol.layer.Tile({
      source: new ol.source.OSM()
    });

    var center = ol.proj.fromLonLat([0, 0]);

    var view = new ol.View({
      center: center,
      zoom: 2
    });

    var map = new ol.Map({
      target: 'map',
      layers: [layer, vectorLayer],
      view: view
    });

    OpenLayer.drawMarker();

  },

  drawMarker: function(){
    var transform = ol.proj.getTransform('EPSG:4326', 'EPSG:3857');
    OpenLayer.locations.forEach(function(location){
      var feature = new ol.Feature(location);
      var coordinate = transform([parseFloat(location.longitude), parseFloat(location.latitude)]);
      var geometry = new ol.geom.Point(coordinate);
      feature.setGeometry(geometry);
      // add the feature to the source
      OpenLayer.vectorSource.addFeature(feature);
    });
  },

  markerStyle: function(feature) {
    var markerColor = feature.P.public ? 'green' : 'red';
    var style = new ol.style.Style({
      image: new ol.style.Circle({
        radius: 6,
        stroke: new ol.style.Stroke({
          color: 'white',
          width: 2
        }),
        fill: new ol.style.Fill({
          color: markerColor
        })
      })
    });
    return [style];
  }

};
