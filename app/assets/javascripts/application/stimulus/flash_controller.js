import { Controller } from 'stimulus'
import toastr from '../toastr.js'

export default class extends Controller {
  static targets = [ 'message' ]

  connect() {
    toastr[this.data.get('type')](this.messageTarget.innerText)
  }
}
