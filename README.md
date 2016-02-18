# ContactDetective

ContactDetective is a simple, straight forward API that allows you to extract and mine contact data from text and HTML. Specifically, the `ContactDetective` module allows your to extract physical addresses, emails and phone numbers from links and text documents. The API is a Ruby gem thats easily installable.

[Gem Page](https://rubygems.org/gems/ContactDetective)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ContactDetective'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ContactDetective

## Usage

###Main Functions:

#####`ContactDetective::gethtmlfromlink(link)`:
Returns the HTML string from a hyper link string. Will raise an error if the link is invalid or does not load an HTML document

#####`ContactDetective::phonenumbers(link)`:
Returns an array of strings representing the phone numbers present in the link given. The following phone number formats will be recognized: `(XXX) XXX-XXXX`, `XXX-XXX-XXXX`, and `XXX XXX XXXX`, where `X` is a number in 0-9.

#####`ContactDetective::emails(link)`:
Returns an array of strings representing the email addresses present in the link given. Emails will only be captured if represented in the format `Albert@Something.com`, with any possible names or website extensions.

#####`ContactDetective::addresses(link)`:
Returns an array of strings representing the physical addresses present in the link given. It will pick up street numbers and names, cities and states, as well as zipcodes. The specific address class allows you to select addresses from specific streets.

#####`ContactDetective::allcontacts(link)`:
Returns a Hash object of all contact data from the given link. Represents the data under these keys:
```
    contacts['emails'] = emails(link)
    contacts['phonenumbers'] = phonenumbers(link)
    contacts['addresses'] = addresses(link)
```

#####`ContactDetective::contactsjson(link, name)`:
Takes the Hash object from the `allcontacts()` function and serializses it to a JSON object and saves it as a JSON file in the working directory that gem is run on.

For functions from specific classes, see the wiki.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jweinst1/ContactDetective.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

