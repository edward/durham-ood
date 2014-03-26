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

# Move into a forwarding thing on Array or into an Array refinement inside of HouseSong
class ShufflerExceptForTheLastElement
  attr_reader :random_seed, :subjects
  def initialize(subjects, random_seed = nil)
    @subjects = subjects
    @random_seed = random_seed || Random.new_seed
  end

  def shuffle
    subjects[0...-1].shuffle(random: Random.new(random_seed)) << subjects[-1]
  end
end


seed = Random.new(1)
# Different (WTF)
[].shuffle(random: seed)
[].shuffle(random: seed)

# Same (good!)
[].shuffle(random: Random.new(1))
[].shuffle(random: Random.new(1))