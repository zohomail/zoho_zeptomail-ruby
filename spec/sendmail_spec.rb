require 'rspec'
require 'vcr'
require 'json'
require 'zoho_zeptomail-ruby'

# VCR.configure do |config|
#   config.cassette_library_dir = './fixtures'
#   config.hook_into :webmock
#   config.filter_sensitive_data('<AUTH>') do |interaction|
#     interaction.request.headers['Authorization'][0]
#   end
# end

print "This is for the send mail api \n"
RSpec.describe ZohoZeptoMail::SendMail do
  let(:client) { ZohoZeptoMail::Client.new('your_zoho_zeptomail_token','host_region') }
  let(:email) { ZohoZeptoMail::SendMail.new(client) }

  it 'sends an email' do
    VCR.use_cassette('email/sendmail') do
      email.add_recipients("address" => "jon@zylker.com", "name" => "Ron")
      email.add_recipients("address" => "leslie@zylker.com", "name" => "Leslie")
      email.add_cc("address" => "april@zylker.com", "name" => "Chris")
      email.add_bcc("address" => "april@zylker.com", "name" => "Andy")
      email.add_from("address"=> "rewrjon@zylker.com", "name"=> "April")
      email.add_subject("Time to Check")
      email.add_body("htlllo \n <b>Time</b>")
      email.add_attachment(content: 'spec/test.jpeg', filename: 'Hello.jpeg', mime_type: 'image/png')
      email.add_attachment(content: 'spec/sample.pdf', filename: 'He.pdf', mime_type: 'plain/text')
      email.send
    end
  end
end

