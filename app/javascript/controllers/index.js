import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@stimulus/webpack-helpers"

const application = Application.start()
const context = require.context('.', true, /_controller\.js$/)
application.load(definitionsFromContext(context))

// Configure Stimulus development experience
application.warnings = true
application.debug    = false
window.Stimulus      = application

export { application }