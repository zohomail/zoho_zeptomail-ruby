<a href="https://www.zoho.com/zeptomail"><img src="https://www.zohowebstatic.com/sites/zweb/images/productlogos/zeptomail.svg
" width="200px"/></a>


Zoho ZeptoMail Ruby SDK

- [Installation](#installation)
  - [Setup](#setup)
- [Usage](#usage)
  - [Email](#email)
    - [Send an email](#send-an-email)
    - [Add CC, BCC recipients](#add-cc-bcc-recipients)
    - [Send a template-based email](#send-a-template-based-email)
- [License](#license)

# Installation

## Setup

```bash
gem install zoho_zeptomail-ruby
```

You will have to initalize it in your Ruby file with `require "zeptomail-ruby"`.

## Email

### Send an email

```ruby
require "zoho_zeptomail-ruby"

ms_client = ZohoZeptoMail::Client.new('your_zoho_zeptomail_token', 'host_region')

# Intialize the email class
ms_email = ZohoZeptoMail::SendMail.new(ms_client) }

# Add parameters
ms_email.add_recipients("email" => "jon@zylker.com", "name" => "Jon")
ms_email.add_recipients("email" => "leslie@zylker.com", "name" => "Leslie")
ms_email.add_from("email" => "april@zylker.com", "name" => "April")
ms_email.add_subject("Time")
ms_email.add_body("Time is money. Let's go. \n <b>Time is money. Let's go.</b>")

# Send the email
ms_email.send
```

### Add CC, BCC recipients

```ruby
require "zoho_zeptomail-ruby"

ms_client = ZohoZeptoMail::Client.new('your_zoho_zeptomail_token', 'host_region')

# Intialize the email class
ms_email = ZohoZeptoMail::SendMail.new(ms_client) }

# Add parameters
ms_email.add_recipients("email" => "ron@zylker.com", "name" => "Ron")
ms_email.add_recipients("email" => "leslie@zylker.com", "name" => "Leslie")
ms_email.add_cc("email" => "chris@zylker.com", "name" => "Chris")
ms_email.add_bcc("email" => "andy@zylker.com", "name" => "Andy")
ms_email.add_from("email" => "april@zylker.com", "name" => "April")
ms_email.add_subject("Time")
ms_email.add_body("Time is money. Let's go. \n <b>Time is money. Let's go.</b>")

# Send the email
ms_email.send
```

### Send a template-based email

```ruby
require "zoho_zeptomail-ruby"

ms_client = ZohoZeptoMail::Client.new('your_zoho_zeptomail_token', 'host_region')

# Intialize the email class
ms_email = ZohoZeptoMail::SendTemplateMail.new(ms_client) }

# Add parameters
ms_email.add_recipients("email" => "ron@zylker.com", "name" => "Ron")
ms_email.add_recipients("email" => "leslie@zylker.com", "name" => "Leslie")
ms_email.add_from("email" => "april@zylker.com", "name" => "April")
ms_email.add_subject("Time")
email.add_template(key: '22d6f.2a5f13c9.k1.274164c0-b792-11ef-88ef-525400e18d05.193b4a2b50c', value: '{"name":"name_value","OTP":"OTP_value","team":"team_value","product_name":"product_name_value"}')
# Send the email
ms_email.send
```

# License

[The MIT License (MIT)](LICENSE)

