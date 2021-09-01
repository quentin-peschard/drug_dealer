import mapboxgl from '!mapbox-gl';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
    center: [2.333857, 48.861530],
    zoom: 9
  });
};

// .setPopup(popup)

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    // const popup = new mapboxgl.Popup().setHTML(marker.info_window);
    const element = document.createElement('div');
    element.id = marker.id;
    element.className = "marker";
    const markerElement = new mapboxgl.Marker(element)
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);

    markerElement.getElement().addEventListener('click', (event) => {
      document.querySelectorAll('.marker').forEach((marker) => {
        marker.classList.remove("active");
      });

      event.currentTarget.classList.add('active');
      if (swiper) {

        // document.querySelector('.swiper').addEventListener('slideChange', () => {
        //   console.log('change')
        // })

        const slider = document.getElementById(`pharmacy_${event.currentTarget.id}`)
        const slideIndex = parseInt(slider.dataset.swiperSlideIndex) + 1;
        swiper.slideTo(slideIndex, 400)
      }
    });
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 50, maxZoom: 12 });
};


const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
