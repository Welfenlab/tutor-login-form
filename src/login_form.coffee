
createViewModel = (ko, config) ->
  class LoginViewModel
    constructor: ->
      @username = ko.observable config.username
      @password = ko.observable ''

      @mayLogin = ko.computed => config.validate @username(), @password()

      @isLoggingIn = ko.observable false

    login: ->
      @isLoggingIn true

      config.authorize @username(), @password(), =>
        @isLoggingIn false

  viewModel: LoginViewModel
  template: config.html


module.exports = createViewModel
