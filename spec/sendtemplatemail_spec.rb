require 'rspec'
require 'vcr'
require 'json'
require 'zoho_zeptomail'

VCR.configure do |config|
  config.cassette_library_dir = './fixtures'
  config.hook_into :webmock
  config.filter_sensitive_data('<AUTH>') do |interaction|
    interaction.request.headers['Authorization'][0]
  end
end

print "This is for the send Template mail api\n"
RSpec.describe ZohoZeptoMail::SendTemplateMail do
  let(:client) { ZohoZeptoMail::Client.new('your_zoho_zeptomail_token','host_region') }
  let(:email) { ZohoZeptoMail::SendTemplateMail.new(client) }

  it 'sends an email' do
    VCR.use_cassette('email/sendtemplatemail') do
      email.add_from("address"=> "rewrjon@zylker.com", "name"=> "April")
      email.add_recipients("address" => "jon@zylker.com", "name" => "Ron")
      email.add_recipients("address" => "april@zylker.com", "name" => "Andy")
      email.add_cc("address" => "erfapril@zylker.com", "name" => "Chris")
      email.add_bcc("address" => "dfnkapril@zylker.com", "name" => "Andy")
      email.add_template(key: '2d6f.32wefdhfi.23rjrgdfni', value: '{"name":"name_value","OTP":"OTP_value","team":"team_value","product_name":"product_name_value"}')
      email.send
    end
  end
end

