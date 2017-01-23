OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '898356746549-u6b4si350kdncdl70bat638flg563o47.apps.googleusercontent.com', 'sFBRDBw2gkyf6Wnmu1KpB-YB', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
  provider :facebook, '375315252824297', '13b89c19bc6ca1aa2fbf8894f4c6b7fc', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
