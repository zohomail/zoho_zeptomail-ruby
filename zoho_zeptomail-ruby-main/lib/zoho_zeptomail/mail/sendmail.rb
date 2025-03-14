
# frozen_string_literal: true

require 'base64'

module ZohoZeptoMail
  # Send an mail through ZohoZeptoMail API
  class SendMail
    attr_accessor :client,
                  :from,
                  :recipients,
                  :subject,
                  :body,
                  :cc,
                  :bcc,
                  :reply_to,
                  :attachments

    def initialize(client = ZohoZeptoMail::Client.new)
      @client = client
      @from = {}
      @recipients = []
      @body = nil
      @bcc = []
      @cc = []
      @reply_to = []
      @subject = nil
      @attachments = []
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

    def add_subject(subject)
      @subject = subject
    end

    def add_body(body)
      @body = body
    end

    def add_attachment(content:, filename:, mime_type:)
      content_string = content.to_s
      if File.readable?(content_string)
        data = File.read(content_string)
        content_string = data
      end
      add_attachments(content: content_string, filename: filename, mime_type: mime_type)
    end

    def add_attachments(content:, filename:, mime_type:)
        data_content = Base64.strict_encode64(content.to_s)
        @attachments << { 'content' => data_content, 'name' => filename, 'mime_type' => mime_type }
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
        'subject' => @subject,
        'htmlbody' => @body,
        'reply_to' => @reply_to,
        'cc' => @cc,
        'bcc' => @bcc,
        'attachments' => @attachments,
      }
      response = client.http.post("https://#{client.host_region}/v1.1/email", json: message)
      puts "Response: #{handle_to_response(response)}"
    end
  end
end
