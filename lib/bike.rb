class Bike

  attr_reader :condition

  def initialize
    @condition = 'working'
  end

  def report_broken
    @condition = 'broken'
  end

  def working?
    true
  end

end
