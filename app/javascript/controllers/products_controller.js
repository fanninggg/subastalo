import { Controller } from "stimulus";

export default class extends Controller {

  static targets = ['timer', 'bidInput', 'visibilityLabel', 'auctionEndedBtn']

  connect() {
    if(this.hasTimerTarget) {
      this.interval = window.setInterval(this._tick, 1000);
    }
  }

  increment() {
    const increment = parseInt(this.bidInputTarget.dataset.increment)
    this.bidInputTarget.value = parseInt(this.bidInputTarget.value) + increment
  }

  decrement() {
    const winningBid = parseInt(this.bidInputTarget.dataset.winning) / 100
    const minimum = parseInt(this.bidInputTarget.dataset.minimum / 100)
    const increment = parseInt(this.bidInputTarget.dataset.increment)
    if(winningBid) {
      if(parseInt(this.bidInputTarget.value) - increment <= winningBid) {
        this.bidInputTarget.value = winningBid + increment
      } else {
        this.bidInputTarget.value = parseInt(this.bidInputTarget.value) - increment
      }
    } else {
      if(parseInt(this.bidInputTarget.value) - increment <= minimum) {
        this.bidInputTarget.value = minimum
      } else {
        this.bidInputTarget.value = parseInt(this.bidInputTarget.value) - increment
      }
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
      clearInterval(this.interval);
      this.timerTargets.forEach((timer) => {
        timer.classList.add('timer-finished')
      })
      this.timerTargets.forEach((timer) => {
        timer.innerText = "00:00:00:00";
      })
      this._openEndedModal()
    }
  }

  _openEndedModal() {
    this.auctionEndedBtnTarget.children[0].click();
  }
}
