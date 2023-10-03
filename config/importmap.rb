# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "typed.js", to: "https://ga.jspm.io/npm:typed.js@2.0.16/dist/typed.module.js"
pin "stimulus-confetti", to: "https://ga.jspm.io/npm:stimulus-confetti@1.0.1/dist/stimulus_confetti.modern.js"
pin "canvas-confetti", to: "https://ga.jspm.io/npm:canvas-confetti@1.6.1/dist/confetti.module.mjs"
