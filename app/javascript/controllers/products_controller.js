import { Controller } from "stimulus";

export default class extends Controller {

  static targets = ['timer', 'bidInput', 'visibilityLabel', 'auctionEndedBtn']

  connect() {
    if(this.hasTimerTarget) {
      setInterval(this._tick, 1000);
    }
  }

  increment() {
    this.bidInputTarget.value = parseInt(this.bidInputTarget.value) + 1
  }

  decrement() {
    if(parseInt(this.bidInputTarget.value) - 1 === 0) {
      this.bidInputTarget.value = 1
    } else {
      this.bidInputTarget.value = parseInt(this.bidInputTarget.value) - 1
    }
  }

  changeVisibility() {
    if (this.visibilityLabelTarget.innerText === 'Visible') {
      this.visibilityLabelTarget.innerText = 'Oculto'
    } else {
      this.visibilityLabelTarget.innerText = 'Visible'
    }
  }

  // Private Methods

  _tick = () => {
    const endTime = new Date(this.timerTarget.dataset.time)
    var now = new Date().getTime();
    var distance = endTime.getTime() - now;
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    // Need to change both mobile and dekstop timers
    this.timerTargets.forEach((timer) => {
      timer.innerText = `${days}:${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`
    })
    if (distance < 0) {
      clearInterval(x);
      this.timerTarget.classList.add('timer-finished')
      this.timerTarget.innerText = "Subasta terminada";
      this._openEndedModal()
    }
  }

  _openEndedModal() {
    this.auctionEndedBtnTarget.children[0].click();
  }
}
