
# frozen_string_literal: true

require 'base64'

module ZohoZeptoMail
  # Send an Template Mail through ZohoZeptoMail API
  class SendTemplateMail
    attr_accessor :client,
                  :from,
                  :recipients,
                  :cc,
                  :bcc,
                  :reply_to,
                  :template_key,
                  :template_value

    def initialize(client = ZohoZeptoMail::Client.new)
      @client = client
      @from = {}
      @recipients = []
      @bcc = []
      @cc = []
      @reply_to = []
      @template_key = nil
      @template_value = nil
    end

    def add_recipients(recipients)
      @recipients << {'email_address' => recipients}
    end

    def add_from(from)
      @from = from
    end

    def add_cc(cc)
      @cc << {'email_address' => cc}
    end

    def add_bcc(bcc)
      @bcc << {'email_address' => bcc}
    end

    def add_reply_to(reply_to)
      @reply_to << reply_to
    end

    def add_template(key:, value:)
      @template_key = key.to_s
      @template_value = value.to_s
    end

    def handle_to_response(response)
        response_data = {}
        data = JSON.parse(response.body)

        if response.code.to_i / 100 == 2
          response_data['status'] = 'success'
          response_data['message'] = data['data'][0]['message'] || 'successfully sent the email'
        else
          response_data['status'] = 'failure'
          response_data['message'] = data['error']['details'][0]['message']

          begin
            response_data['target'] = data['error']['details'][0]['target']
          rescue
          end
        end

        response_data
    end

    def send
      message = {
        'from' => @from,
        'to' => @recipients,
        'reply_to' => @reply_to,
        'cc' => @cc,
        'bcc' => @bcc,
        'mail_template_key' => @template_key,
        'merge_info' => @template_value
      }
      response = client.http.post("https://#{client.host_region}/v1.1/email/template", json: message)
      puts "Response: #{handle_to_response(response)}"
    end
  end
end
