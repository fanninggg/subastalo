import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "page", "page1", "page2", "page3", "pageCounter", "dot1", "dot2", "photoPreview", "documentNames", "profileDocumentNames" ]

  closeSelf(event) {
    const modal = event.currentTarget.dataset.self
    $(`#${modal}`).modal('hide');
  }

  nextPage(event) {
    const num = event.currentTarget.dataset.page
    if (num == "2") {
      this._hidePages()
      this.page2Target.classList.remove('d-none')
      this.pageCounterTarget.innerText = "2"
      this.dot1Target.classList.add('active-dot')
    } else {
      this._hidePages()
      this.page3Target.classList.remove('d-none')
      this.pageCounterTarget.innerText = "3"
      this.dot2Target.classList.add('active-dot')
    }
  }

  preview(event) {
    if (event.currentTarget.files && event.currentTarget.files[0]) {
      const reader = new FileReader();
      reader.onload = (event) => {
        this.photoPreviewTarget.src = event.currentTarget.result;
      }
      reader.readAsDataURL(event.currentTarget.files[0])
    }
  }

  documentPreview(event) {
    if (event.currentTarget.files && event.currentTarget.files[0]) {
      const reader = new FileReader();
      reader.onload = (event) => {
        this.documentNamesTarget.innerText = `Archivos agregados`
      }
      reader.readAsDataURL(event.currentTarget.files[0])
    }
  }

  profileDocumentPreview(event) {
    if (event.currentTarget.files && event.currentTarget.files[0]) {
      const reader = new FileReader();
      reader.onload = (event) => {
        this.profileDocumentNamesTarget.innerText = `Archivos agregados`
      }
      reader.readAsDataURL(event.currentTarget.files[0])
    }
  }

  // Private Methods

  _hidePages() {
    this.pageTargets.forEach((page) => {
      page.classList.add('d-none')
    })
  }
}
