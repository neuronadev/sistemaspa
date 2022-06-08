import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@stimulus/webpack-helpers"
import Select2Controller from 'stimulus-select2'

const application = Application.start()
const context = require.context('.', true, /_controller\.js$/)
application.load(definitionsFromContext(context))
application.register("select2", Select2Controller)

// Configure Stimulus development experience
application.warnings = true
application.debug    = false
window.Stimulus      = application

export { application }