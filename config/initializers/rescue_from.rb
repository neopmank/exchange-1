require 'openstax_rescue_from'

OpenStax::RescueFrom.configure do |config|
  config.raise_exceptions = Rails.application.secrets['rescue_from']['raise_exceptions'] ||
                              Rails.application.config.consider_all_requests_local

  config.app_name = Rails.application.secrets['rescue_from']['app_name']
  config.app_env = Rails.application.secrets['rescue_from']['app_env']
  config.contact_name = Rails.application.secrets['rescue_from']['contact_name']

  # config.notifier = ExceptionNotifier

  # config.html_error_template_path = 'errors/any'
  # config.html_error_template_layout_name = 'application'

  # config.email_prefix = "[#{app_name}] (#{app_env}) "
  config.sender_address = Rails.application.secrets['rescue_from']['sender_address']
  config.exception_recipients = Rails.application
                                     .secrets['rescue_from']['exception_recipients']
end
