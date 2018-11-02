import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['file', 'label']

  change() {
    this.labelTarget.textContent = this.fileTarget.value.split(/(\\|\/)/g).pop()
  }
}
