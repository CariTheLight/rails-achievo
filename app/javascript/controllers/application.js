import { Application } from "@hotwired/stimulus"
//= require jquery3
//= require jquery_ujs
//= require_tree .


const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
