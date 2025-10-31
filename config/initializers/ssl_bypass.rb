# Global Ruby SSL bypass because ruby-openai is somehow not working
if Rails.env.development?
  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end
