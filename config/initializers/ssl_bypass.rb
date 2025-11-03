# Global Ruby SSL bypass because ruby-openai is somehow not working. I tried everything. I think it might be due to my adblockers or something else. This disables SSL verification.
# DOCS - https://ruby-doc.org/stdlib-3.0.0/libdoc/openssl/rdoc/OpenSSL.html
if Rails.env.development?
  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end
