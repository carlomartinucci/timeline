import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ['object']

  connect() {
    const target = [...this.objectTargets].pop()
    if (!target)
      throw "No valid template found, please build a nested object with `@object.associations.build`"
    this.parent = target.parentNode
    this.insertBefore = target.nextSibling
    this.template = target.cloneNode(true)
    target.parentNode.removeChild(target)
    this.index = this.objectTargets.length
  }

  add() {
    let clone = this.template.cloneNode(true)
    clone.classList.remove('d-none')
    clone.innerHTML = clone.innerHTML.replace(/_attributes\]\[\d+\]\[(\w+)\](\[\])?"/g, `_attributes][${this.index}][$1]$2"`).replace(/_attributes_\d+_(\w+)"/g, `_attributes_${this.index}_$1"`)
    if (this.insertBefore)
      this.parent.insertBefore(clone, this.insertBefore)
    else
      this.parent.appendChild(clone)
    this.index++
  }

  remove(event) {
    this.objectTargets.forEach((el, i) => {
      if (el.contains(event.target)) {
        el.classList.add('d-none')
        $(el).find('input[type=checkbox]').prop('checked', 'checked')
      }
    })
  }

}
