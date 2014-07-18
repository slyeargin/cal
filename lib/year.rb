class Year

  attr_accessor :year

  def initialize(year)
    @year = year
  end

  def leap?
    if @year % 4 == 0
      if @year % 100 == 0 && @year % 400 != 0
        return false
      end
      return true
    end
    false
  end

end
