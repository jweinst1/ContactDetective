require "ContactDetective/version"

module ContactDetective
  #main functions______
  #gets html from a link
  def self.gethtmlfromlink(link)
    require 'open-uri'
    return open(link, &:read)
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
