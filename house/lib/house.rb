class HouseSong
  attr_reader :subjects
  def initialize(subjects)
    @subjects = subjects
  end

  def sing
    subjects.length.times.map{|number| verse(number+1)}
  end

  def verse(number)
    'This is ' + subjects.last(number).join(' ') + ".\n\n"
  end
end
