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
    "#{name} #{@year.year}".center(LINE_LENGTH).rstrip
  end

  def length
    unless @month == 2 && @year.leap?
      return MONTH_LENGTH[@month]
    else
      return 29
    end
  end

  def build_day(count, weekday)
    if count < 10 && weekday > 0
      day = "\s\s#{count}"
    elsif count >= 10 && weekday == 0
      day = "#{count}"
    else
      day = "\s#{count}"
    end
    day
  end

  def build_week(week, align_left=false)
    if align_left
      return week.join
    else
      week << "\n"
      return week.join.rjust(LINE_LENGTH+1)
    end
  end

  def build_month(month, year)
    day_count = 1
    first_day = ZellersCongruence.calculate(month, year)
    day_of_week_count = (first_day == 0) ? 6 : first_day - 1
    output = []
    week = []
    week_count = 0
    until day_count == self.length + 1
      if day_of_week_count < 7
        week << build_day(day_count, day_of_week_count).rstrip
        day_of_week_count +=1
        day_count += 1
      else
        output << build_week(week)
        week_count += 1
        day_of_week_count = 0
        week = []
      end
    end
    if week.size > 0
      output << build_week(week, true)
    end
    while week_count < 6
      output << "\n"
      week_count += 1
    end
    output.join
  end

  def to_s
    output = header
    output << WEEKDAYS
    output << build_month(@month, @year.year)
    output
  end
end
