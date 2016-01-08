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
  end
end
