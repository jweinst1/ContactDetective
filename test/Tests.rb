require 'test/unit'
require 'lib/ContactDetective.rb'

#basic testing functions
class Testfuncs
  def self.assertTrue(input)
    input == true
  end
  def self.assertEqual(elem1, elem2)
    elem1 == elem2
  end
end

class Emailtests
  def self.test1
    Testfuncs::assertEqual(ContactDetective::Emails.getallemails("hello i am rupert@ao.com"), ["rupert@ao.com"])
  end
  def self.test2
    Testfuncs::assertEqual(ContactDetective::Emails.getallemails("hello i am georgefra4@comcast.com"), ["georgefra4@comcast.com"])
  end
end

class Phonetests
  def self.test1
    Testfuncs::assertEqual(ContactDetective::Phonenumbers.getallnumbers("55665 455 765 8977 (455) 777-8888"), ["455 765 8977", "(455) 777-8888"])
  end
  def self.test2
    Testfuncs::assertEqual(ContactDetective::Phonenumbers.getallnumbers("665 455 7656 8977 (455) 777-8888"), ["665 455 7656", "(455) 777-8888"])
  end
end

class Addresstests
  def self.test1
    Testfuncs::assertEqual(ContactDetective::Addresses.getstreets("hello, i live on 1423 frankfurt street"), ["1423 frankfurt street"])
  end
end