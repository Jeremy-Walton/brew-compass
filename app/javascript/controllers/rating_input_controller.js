import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['input']
  static values = { options: Object }

  change(event) {
    this.inputTarget.value = this.#optionFromValue(event.target.value)
  }

  #optionFromValue(value) {
    return Object.keys(this.optionsValue).find(key => this.optionsValue[key] === value)
  }
}
