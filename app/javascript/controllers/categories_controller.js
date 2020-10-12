import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "slider", "filterBtn", "filters" ]

  connect() {
  }

  showFilters() {
    this.filtersTarget.classList.toggle('filters-open')
  }

  toggleSlider() {
    this.sliderTarget.classList.toggle('slider-open')
  }

  triggerFilter() {
    this.filterBtnTarget.click();
  }
}
