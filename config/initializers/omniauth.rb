Rails.application.config.middleware.use OmniAuth::Builder do 
  client_id = '455519824919-j4arbb9un7jdja2k6u7kg33o5dr5eggi.apps.googleusercontent.com'
  secret = '5lZr8Grl3VJ7lAmYje7mWA5A'

  options = {
    skip_jwt: true,
    client_options: {
      ssl: {
        ca_path: File.dirname(__FILE__) + '/../../',
        ca_file: File.dirname(__FILE__) + '/../../ca-bundle.crt'
      }
    }
  }	

  provider :google_oauth2, client_id, secret, options
end
