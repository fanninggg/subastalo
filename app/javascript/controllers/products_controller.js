import { Controller } from "stimulus";

export default class extends Controller {

  static targets = ['timer']
  connect() {
    setInterval(this.tick, 1000);
  }

  tick = () => {
    const endTime = new Date(this.timerTarget.dataset.time)
    var now = new Date().getTime();
    var distance = endTime.getTime() - now;
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    this.timerTarget.innerText = `${days}:${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`
    if (distance < 0) {
      clearInterval(x);
      this.timerTarget.innerText = "Auction Finished";
    }
  }
}
