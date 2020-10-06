import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "documentHolder", "rejectionForm", "rejectionOptions", "rejectionTitle" ]

  connect() {
  }

  fetchDocuments(event) {
    fetch(event.currentTarget.dataset.url)
      .then(response => response.text())
      .then(data => this.documentHolderTarget.innerHTML = data);
  }

  rejectUser() {
    this.rejectionOptionsTarget.classList.add('d-none');
    this.rejectionFormTarget.classList.remove('d-none');
    this.rejectionTitleTarget.innerText = "Rechazar Aplicación";
  }
}
