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

end

class Addresstests

end