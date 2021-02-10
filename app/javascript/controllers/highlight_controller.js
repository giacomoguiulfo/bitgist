import { Controller } from "stimulus"
import hljs from "highlight.js"

export default class extends Controller {
  static targets = [ "code" ]

  connect() {
    hljs.highlightBlock(this.codeTarget)
  }
}
