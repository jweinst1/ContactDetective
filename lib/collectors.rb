#class for sc

class Collector
  def initialize(pattern)
    @pattern = pattern
    @bin = []
  end
  def input(string)
    if string =~ @pattern
      @bin << string
    end
  end
  #tests for a match
  def ismatch(string)
    (string =~ @pattern) ? true : false
  end
  def matches
    @bin
  end
end