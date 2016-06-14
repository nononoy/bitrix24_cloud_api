[![Build Status](https://travis-ci.org/nononoy/bitrix24_cloud_api.svg?branch=master)](https://travis-ci.org/nononoy/bitrix24_cloud_api)

# Bitrix24CloudApi

Ruby library for [Bitrix24 REST API](https://dev.1c-bitrix.ru/rest_help/index.php) **(only Cloud version)**.  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bitrix24_cloud_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitrix24_cloud_api

## Usage

### Oauth2
Bitrix24's oauth2 implementation not compatible with *oauth2 gem*, so there is some changes in realization. Firstly, you have to create client entity. CLIENT_ID and CLIENT_SECRET you can find in your Bitrix24 Marketplace app.
    
    params = { endpoint: api_endpoint,
               client_id: CLIENT_ID,
               client_secret: CLIENT_SECRET,
               scope: "crm", [optional]
               extension: "json", [optional]
               redirect_uri: redirect_uri
    }
    @client = Bitrix24CloudApi::Client.new(params)     

To get oauth2 authorize_url for **code** simple use:
    
    authorize_url = @client.authorize_url
    
To get oauth2 **access_token** use:

    access_token = @client.get_access_token(code)

it's response contains a hash with *oauth2 credentials* and some other usefull data.

To **refresh** oauth2 **access_token** use:
    
    access_token = @client.refresh_token(refresh_token)
    
it's response contains a hash with refreshed *oauth2 credentials*.

If you already **have a valid access_token** add it to the client's attributes `@client.update(access_token: access_token)` or create a new client instance `@client = Bitrix24CloudApi::Client.new(access_token: access_token)`. 
      
### CRM
      
Available models

    * Bitrix24CloudApi::CRM::Activity
    * Bitrix24CloudApi::CRM::ACTIVITY::Communication
       
    * Bitrix24CloudApi::CRM::Company
    * Bitrix24CloudApi::CRM::COMPANY::Userfield
    
    * Bitrix24CloudApi::CRM::Contact
    * Bitrix24CloudApi::CRM::CONTACT::Userfield  
    
    * Bitrix24CloudApi::CRM::Currency
    * Bitrix24CloudApi::CRM::CURRENCY::Localizations  
    
    * Bitrix24CloudApi::CRM::Deal
    * Bitrix24CloudApi::CRM::DEAL::Userfield  
    * Bitrix24CloudApi::CRM::DEAL::ProductRows  
    
    * Bitrix24CloudApi::CRM::Lead
    * Bitrix24CloudApi::CRM::LEAD::Userfield
    * Bitrix24CloudApi::CRM::LEAD::ProductRows
       
    * Bitrix24CloudApi::CRM::Quote
    * Bitrix24CloudApi::CRM::QUOTE::Userfield
    * Bitrix24CloudApi::CRM::QUOTE::ProductRows
    
    * Bitrix24CloudApi::CRM::Localizations
    * Bitrix24CloudApi::CRM::Product
    * Bitrix24CloudApi::CRM::ProductRows
    * Bitrix24CloudApi::CRM::ProductSection
    * Bitrix24CloudApi::CRM::Userfield   
    * Bitrix24CloudApi::CRM::Duplicate
    * Bitrix24CloudApi::CRM::Enum
    * Bitrix24CloudApi::CRM::Invoice
    * Bitrix24CloudApi::CRM::InvoiceStatus    
    * Bitrix24CloudApi::CRM::Communication
    * Bitrix24CloudApi::CRM::Catalog     

All models' metods are provided. Second attribute in method call is a hash for bitrix24 REST API query. Example:
    
    params = { fields: {TITLE: title, PHONE: [VALUE: phone, VALUE_TYPE: "WORK"]} }
    Bitrix24CloudApi::CRM::Lead.add(@client, params)
    Bitrix24CloudApi::CRM::Lead.list(@client)
    Bitrix24CloudApi::CRM::Lead.get(@client, ID: 1)
    
    
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nononoy/bitrix24_cloud_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

