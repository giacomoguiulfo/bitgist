import ApplicationController from "./application_controller"

export default class extends ApplicationController {
  static targets = [ "item" ]
  static values = { size: Number }

  initialize() {
    this.observeMutations(this.refreshSizeValue)
  }

  refreshSizeValue() {
    this.sizeValue = this.itemTargets.length
  }
}
