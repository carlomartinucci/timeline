import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    this.element.addEventListener("submit", console.log);
  }

  disconnect() {
    this.element.removeEventListener("submit", console.log);
  }

}
