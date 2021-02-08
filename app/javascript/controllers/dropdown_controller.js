import { Dropdown } from "tailwindcss-stimulus-components"

export default class CheckboxDropdown extends Dropdown {
  static targets = ["button", "text", "checkbox"]

  setOption(event) {
    this._toggleCheckbox()
    this.textTarget.value = event.srcElement.closest("button").dataset.dropdownText;
    super.toggle();
  }

  _toggleCheckbox() {
    if (this.checkboxTarget.value === "0") {
      this.checkboxTarget.value = "1"
    } else {
      this.checkboxTarget.value = "0"
    }
  }
}
