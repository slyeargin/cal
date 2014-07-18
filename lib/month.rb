class Month
  attr_accessor :month

  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  MONTH_LENGTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  LINE_LENGTH = 20
  WEEKDAYS = "\nSu Mo Tu We Th Fr Sa\n"

  def initialize(month, year)
    @month = month
    @year = Year.new(year)
  end

  def name
    MONTHS[@month]
  end

  def header
    "#{name} #{@year.year}".center(20).rstrip
  end

  def length
    unless @month == 2 && @year.leap?
      return MONTH_LENGTH[@month]
    else
      return 29
    end
  end

  def to_s
    day_count = 1
    output = header
    output << WEEKDAYS
    first_day = ZellersCongruence.calculate(month, @year.year)
    day_of_week_count = first_day - 1
    if first_day == 0
      output << ("\s1").rjust(LINE_LENGTH)
      day_count += 1
      day_of_week_count = 7
    end
    until day_count == self.length + 1
      if day_of_week_count < 7
        if day_count < 10 && day_of_week_count > 0
          output << "\s\s#{day_count}"
        elsif day_count > 10 && day_of_week_count == 0
          output << "#{day_count}"
        else
          output << "\s#{day_count}"
        end
        day_of_week_count +=1
        day_count += 1
      else
        output << "\n"
        day_of_week_count = 0
      end
    end
    output
  end
end
