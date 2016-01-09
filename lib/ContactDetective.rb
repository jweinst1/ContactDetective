require "ContactDetective/version"

module ContactDetective
  #main functions______
  #gets html from a link
  def self.gethtmlfromlink(link)
    require 'open-uri'
    return open(link, &:read)
  end
  #gets all emails from a link
  def self.emails(link)
    text = ContactDetective::gethtmlfromlink(link)
    text.scan(/[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-z]+/)
  end
  def self.phonenumbers(link)
    text = ContactDetective::gethtmlfromlink(link)
    ContactDetective::Phonenumbers.getallnumbers(text)
  end
  def self.addresses(link)
    text = ContactDetective::gethtmlfromlink(link)
    citystatezip = ContactDetective::Addresses.citystatezip(text)
    streets = ContactDetective::Addresses.getstreets(text)
    return citystatezip + streets
  end
  #creates Hash object of all contact data
  def self.allcontacts(link)
    contacts = Hash.new()
    contacts['emails'] = emails(link)
    contacts['phonenumbers'] = phonenumbers(link)
    contacts['addresses'] = addresses(link)
    return contacts
  end
  #writes the contact data to a json file
  def self.contactsjson(link, name)
    require 'json'
    contact = allcontacts(link).to_json
    File.open(name, 'w') { |file| file.write(contact) }
  end
  class Emails
    #gets every email in the text
    def self.getallemails(text)
      text.scan(/[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-z]+/)
    end
    #gets every email with specific extension
    def self.emailswithext(text, ext)
      string = '[a-zA-Z0-9]+@[a-zA-Z0-9]+\.' + ext
      patt = Regexp.new(string)
      text.scan(patt)
    end
    #gets emails with prefix before @ sign
    def self.emailswithname(text, name)
      string = name + '@[a-zA-Z0-9]+\.[a-z]+'
      patt = Regexp.new(string)
      text.scan(patt)
    end
  end
  class Phonenumbers
    def self.getallnumbers(text)
      pattone = text.scan(/[0-9]{3}\-[0-9]{3}\-[0-9]{4}/)
      patttwo = text.scan(/\([0-9]{3}\)\-[0-9]{3}\-[0-9]{3}/)
      pattthree = text.scan(/[0-9]{3} [0-9]{3} [0-9]{4}/)
      return pattone + pattwo
    end
    #gets numbers by area code
    def self.getnumbersbyarea(text, areacode)
      string = areacode + '\-[0-9]{3}\-[0-9]{4}'
      patt = Regexp.new(string)
      text.scan(patt)
    end
    #all numbers without a specific area
    def self.getwithoutarea(text, areacode)
      nums = text.scan(/[0-9]{3}\-[0-9]{3}\-[0-9]{4}/)
      antipatt = Regexp.new(areacode + '\-[0-9]{3}\-[0-9]{4}')
      nums.reject {|elem| elem =~ antipatt}
    end

  end
  class Addresses
    def self.getstreets(text)
      text.scan(/[0-9]+ [a-zA-Z] street/)
    end
    def self.getlanes(text)
      text.scan(/[0-9]+ [a-zA-Z] lane/)
    end
    def self.getroadext(text, road)
      patt = Regexp.new('[0-9]+ [a-zA-Z] ' + road)
      text.scan(patt)
    end
    #gets city state in format City, ST
    def self.getcitystates(text)
      text.scan(/[A-Z][a-z]+, [A-Z]{2}/)
    end
    def self.citystatezip(text)
      text.scan(/[A-Z][a-z]+, [A-Z]{2} [0-9]{5}/)
    end
  end
  class Utils

    def self.removebrackets(text)
      text.split(/<[^<>]+>/)
    end
    def self.onlybrackets(text)
      text.scan(/<[^<>]+>/)
    end
    def self.replacebrackets(text)
      text.gsub(/<[^<>]+>/, "")
    end
    def self.sentfragments(text)
      wordfrags = []
      text.split(/<[^<>]+>/).each do |elem|
        if elem =~ /^[a-zA-Z]+ [a-zA-Z]*$/
          wordfrags << elem
        end
      end
      return wordfrags
    end
    def self.getwords(text)
      words = text.scan(/ ([a-zA-Z]+) /)
      filtered = []
      words.each {|elem| filtered << elem[0]}
    end
    def self.makeregex(string)
      Regexp.new(string)
    end
    def self.getnumeric(string)
      string.scan(/[0-9]+/)
    end
    def makeJSON(hashobj)
      require 'json'
      hashobj.to_json
    end
  end
end
