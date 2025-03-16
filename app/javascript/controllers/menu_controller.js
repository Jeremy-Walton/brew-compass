import { Controller } from '@hotwired/stimulus'
import { useClickOutside } from 'stimulus-use'

export default class extends Controller {
  static targets = ['trigger', 'panel']

  static values = {
    panelOpenClass: { type: String, default: 'menu__panel--open' },
  }

  connect() {
    useClickOutside(this)
  }

  clickOutside(_event) {
    this.close()
  }

  clickTrigger(event) {
    event.preventDefault()
    this.toggle()
  }

  toggle(force = undefined) {
    this.panelTarget.classList.toggle(this.panelOpenClassValue, force)
  }

  open() {
    this.toggle(true)
  }

  close() {
    this.toggle(false)
  }
}
