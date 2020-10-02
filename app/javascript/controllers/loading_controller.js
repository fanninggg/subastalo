import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "dot" ]

  connect() {
    if(this.dotTargets) {
      setInterval(this._moveDot, 600);
    }
  }

  _moveDot = () => {
    const active = this.dotTargets.filter(dot => dot.classList.length > 1);
    if(active[0]) {
      if (active[0].nextElementSibling) {
        active[0].nextElementSibling.classList.add('loading-dot-active');
      } else {
        this.dotTargets[0].classList.add('loading-dot-active');
      }
      active[0].classList.remove('loading-dot-active');
    }
  }
}
