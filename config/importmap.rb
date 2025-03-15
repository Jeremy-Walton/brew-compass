# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "@rolemodel/turbo-confirm", to: "@rolemodel--turbo-confirm.js" # @2.1.1
pin '@shoelace-style/shoelace/components/rating', to: 'https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.20.1/cdn/components/rating/rating.js' # @2.20.1

pin_all_from "app/javascript/initializers", under: "initializers"
pin_all_from "app/javascript/controllers", under: "controllers"
