# frozen_string_literal: true

require 'http'

ZohoZeptoMail_API_BASE_HOST = 'zeptomail.zoho.com'

# ZohoZeptoMail-ruby is a gem that integrates all endpoints from ZohoZeptoMail API
module ZohoZeptoMail
  class Client
    Domain_list = {
      'zeptomail.zoho.com' => 'zeptomail.com',
      'zeptomail.zoho.in' => 'zeptomail.in',
      'zeptomail.zoho.eu' => 'zeptomail.eu',
      'zeptomail.zoho.jp' => 'zeptomail.jp',
      'zeptomail.zohocloud.ca' => 'zeptomail.ca',
      'zeptomail.zoho.sa' => 'zeptomail.sa',
      'zeptomail.zoho.com.au' => 'zeptomail.com.au',
      'zeptomail.zoho.com.cn' => 'zeptomail.com.cn'
    }

    attr_reader :api_token
    attr_reader :host_region

    # Inits the client.
    def initialize(api_token = ENV.fetch('ZOHO_ZEPTOMAIL_API_KEY_TOKEN', nil), api_host = ENV.fetch('ZOHO_ZEPTOMAIL_HOSTED_REGION', ZohoZeptoMail_API_BASE_HOST))
      raise ArgumentError 'API key token is not provided' if api_token.nil?
      raise ArgumentError 'Host region is not provided' if api_host.nil?
      unless Domain_list.key?(api_host)
        raise ArgumentError 'Invalid domain. Please verify it.'
      end
      @api_token = api_token
      @host_region = api_host
    end

    def http
      HTTP
        .headers('User-Agent' => "Ruby on Rails ZohoZeptoMail",
                 'Accept' => 'application/json',
                 'Authorization' => @api_token)
    end
  end
end
