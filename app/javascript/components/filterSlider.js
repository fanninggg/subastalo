import noUiSlider from 'nouislider'
import wNumb from 'wnumb'

export const initFilterSlider = () => {
  const slider = document.querySelector('.price-slider')
  const existingSlider = document.querySelector('.noUi-target')
  if (slider) {
    // Deletes multiple sliders created by turbolinks and browser back button
    if (existingSlider) {
      existingSlider.children[0].remove()
    }
    const display = document.querySelector('.slider-display')
    const input = document.querySelector('#filter_price')
    const formatter = wNumb({
      decimals: 0,
      prefix: '$',
      thousand: ',',
      encoder: (n) => {
        return n / 100
      },
    })
    const { min, max, start, end } = slider.dataset
    noUiSlider.create(slider, {
      start: [Number(start), Number(end)],
      step: 1000000,
      connect: true,
      range: {
        min: Number(min),
        max: Number(max),
      },
    })

    slider.noUiSlider.on('update', (e) => {
      const [newMin, newMax] = e
      display.innerText = `${formatter.to(newMin)} - ${formatter.to(newMax)}`
      input.value = `${newMin}-${newMax}`
    })
  }
}
