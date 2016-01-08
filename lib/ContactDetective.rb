require "ContactDetective/version"

module ContactDetective
  #gets html from a link
  def gethtmlfromlink(link)
    require 'open-uri'
    return open(link, &:read)
  end
  class Emails

  end
  class Phonenumbers

  end
  class Addresses

  end
  class Utils

    def removebrackets(text)
      text.split(/<[^<>]+>/)
    end
    def onlybrackets(text)
      text.scan(/<[^<>]+>/)
    end
    def replacebrackets(text)
      text.gsub(/<[^<>]+>/, "")
    end
    def sentfragments(text)
      wordfrags = []
      text.split(/<[^<>]+>/).each do |elem|
        if elem =~ /^[a-zA-Z]+ [a-zA-Z]*$/
          wordfrags << elem
        end
      end
      return wordfrags
    end
    def getwords(text)
      words = text.scan(/ ([a-zA-Z]+) /)
      filtered = []
      words.each {|elem| filtered << elem[0]}
    end
  end
end
