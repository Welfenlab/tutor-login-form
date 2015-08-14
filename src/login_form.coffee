
createViewModel = (ko, config) ->
  class LoginViewModel
    constructor: ->
      @pin = ko.observable config.username
      @password = ko.observable ''

      @mayLogin = ko.computed => config.validate @pin(), @password()

      @isLoggingIn = ko.observable false

    login: ->
      @isLoggingIn true

      config.authorize @pin(), =>
        @isLoggingIn false
        window.location.hash = config.redirect

  viewModel: LoginViewModel
  template: config.html


module.exports = createViewModel
