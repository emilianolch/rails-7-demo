import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['input', 'button']

  connect() {
    this.reset()
  }

  reset() {
    this.buttonTarget.disabled = true
    this.inputTarget.value = ''
  }

  inputChanged() {
    this.buttonTarget.disabled = this.inputTarget.value.trim() === ''
  }
}
