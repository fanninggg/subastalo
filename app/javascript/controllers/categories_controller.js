import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "slider", "filterBtn" ]

  connect() {
  }

  toggleSlider() {
    this.sliderTarget.classList.toggle('slider-open')
  }

  triggerFilter() {
    this.filterBtnTarget.click();
  }
}
