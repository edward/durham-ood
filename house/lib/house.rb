class HouseSong
  def sing
    (0..11).map{|number| verse(number)}
  end

  def verse(number)
    'This is' + Subject.for_verse(number) + ".\n\n"
  end
end

class Subject
  def self.for_verse(number)
    new(number).to_s
  end

  attr_reader :number
  def initialize(number)
    @number = number
  end

  def to_s
    ' ' + SUBJECTS[number] + next_subject.to_s
  end

  def next_subject
    if number == 0
      NullSubject.new
    else
      Subject.new(number-1)
    end
  end
end

class NullSubject
  def to_s
    ''
  end
end

SUBJECTS = [
  'the house that Jack built',
  'the malt that lay in',
  'the rat that ate',
  'the cat that killed',
  'the dog that worried',
  'the cow with the crumpled horn that tossed',
  'the maiden all forlorn that milked',
  'the man all tattered and torn that kissed',
  'the priest all shaven and shorn that married',
  'the rooster that crowed in the morn that woke',
  'the farmer sowing his corn that kept',
  'the horse and the hound and the horn that belonged to'
]
