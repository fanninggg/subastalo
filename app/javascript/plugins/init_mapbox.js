import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    new mapboxgl.Marker()
      .setLngLat([ -79.515090, 8.972250 ])
      .addTo(map);

    const bounds = new mapboxgl.LngLatBounds();
    bounds.extend([ -79.515090, 8.972250 ]);
    map.fitBounds(bounds, { padding: 70, maxZoom: 13, duration: 1 });
  }
};

export { initMapbox };
