// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require('@rails/ujs').start()
require('turbolinks').start()
require('@rails/activestorage').start()
require('channels')

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import 'controllers'
import 'bootstrap'
import 'nouislider/distribute/nouislider.css'

import { initFilterSlider } from '../components/filterSlider'
import { initMapbox } from '../plugins/init_mapbox'
import { initProdForm } from '../components/prodForm'
import flatpickr from "flatpickr";


document.addEventListener('turbolinks:load', () => {
  // Preloader
  $(".se-pre-con").fadeOut("slow");
  initFilterSlider()
  initMapbox()
  initProdForm()
  const map = document.getElementById('map')
  if (map) {
    document.querySelector('svg').children[0].children[1].style.fill = '#FD7323'
  }
  flatpickr(".datepicker", {
    enableTime: true,
    altInput: true
  });
})
