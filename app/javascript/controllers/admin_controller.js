import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "documentHolder" ]

  connect() {
  }

  fetchDocuments(event) {
    fetch(event.currentTarget.dataset.url)
      .then(response => response.text())
      .then(data => this.documentHolderTarget.innerHTML = data);
  }
}
