import { Controller } from "stimulus"
import CodeMirror from 'codemirror/lib/codemirror.js';
import 'codemirror/lib/codemirror.css'
import 'codemirror/addon/mode/loadmode.js';
import 'codemirror/mode/meta.js';
import "codemirror-github-light/lib/codemirror-github-light-theme.css";

export default class extends Controller {
  static targets = ["editor", "filename", "language"]
  static values = { language: String, readonly: Boolean }

  connect() {
    this.editor = CodeMirror.fromTextArea(
      this.editorTarget, {
        readOnly: this.readonlyValue ? "nocursor" : false,
        theme: 'github-light',
        lineNumbers: true,
        mode: this.languageValue || "text/plain",
        viewportMargin: Infinity,
      }
    )
    if (!this.hasLanguageValue) {
      this.setLanguage()
    } else {
      this.editor.setSize(null, "auto")
    }
  }

  setLanguage() {
    let language = CodeMirror.findModeByFileName(this.filenameTarget.value)
    if (language) {
      this.languageTarget.value = language.mode
      this.editor.setOption("mode", language.mime)
      CodeMirror.autoLoadMode(this.editor, language.mode);
    } else {
      this.languageTarget.value = "text/plain"
    }
  }

  disconnect() {
    this.editor.toTextArea()
  }
}
