import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "page", "page1", "page2", "page3", "pageCounter", "dot", "dot1", "dot2", "dot3", "photoPreview", "documentNames", "profileDocumentNames" ]

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
      this.dot2Target.classList.add('active-dot')
    } else {
      this._hidePages()
      this.page3Target.classList.remove('d-none')
      this.pageCounterTarget.innerText = "3"
      this.dot3Target.classList.add('active-dot')
    }
  }

  changePage(event) {
    if (event.currentTarget.dataset.pageTarget == 1) {
      this._hidePages()
      this._clearDots()
      this.page1Target.classList.remove('d-none')
      this.pageCounterTarget.innerText = "1"
      this.dot1Target.classList.add('active-dot')
    } else if (event.currentTarget.dataset.pageTarget == 2) {
      this._hidePages()
      this._clearDots()
      this.page2Target.classList.remove('d-none')
      this.pageCounterTarget.innerText = "2"
      this.dot1Target.classList.add('active-dot')
      this.dot2Target.classList.add('active-dot')
    } else {
      this._hidePages()
      this.page3Target.classList.remove('d-none')
      this.pageCounterTarget.innerText = "3"
      this.dot2Target.classList.add('active-dot')
      this.dot3Target.classList.add('active-dot')
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

  _clearDots() {
    this.dotTargets.forEach((dot) => {
      dot.classList.remove('active-dot')
    })
  }

  // ============
  // This is likely to be a few hours work, including things like checking if a user with that email already exists. If we need to do this, lets charge for it
  // ============
  // _validateInputs(num) {
  //   const checknum = num - 1
  //   if (checknum == 1) {
  //     const email = this.page1Target.children[0].children[0].value
  //     const password = this.page1Target.children[1].children[0].value
  //     const confirmPassword = this.page1Target.children[2].children[0].value
  //     if (this._validateEmail(email) && this._validatePassword(password) && this._validatePassword(confirmPassword)) {
  //       return true
  //     }
  //   } else if (checknum == 2) {
  //     console.log(this.page2Target)
  //   } else {
  //     console.log(this.page3Target)
  //   }
  // }

  // _validateEmail(string) {
  //   if (/\S+@\S+\.\S+/.test(string)) {
  //     return true
  //   } else {
  //     console.log('fake')
  //   }
  // }

}
