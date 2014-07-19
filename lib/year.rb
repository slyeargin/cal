class Year

  attr_accessor :year

  LINE_LENGTH = 62
  HEADER = [
    "      January               February               March",
    "       April                  May                   June",
    "        July                 August              September",
    "      October               November              December"
  ]
  WEEKDAYS = "\nSu Mo Tu We Th Fr Sa\s\sSu Mo Tu We Th Fr Sa\s\sSu Mo Tu We Th Fr Sa\n"
  BLOCK_LENGTH = 6

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

  def to_s
    output = "#{@year}".center(LINE_LENGTH).rstrip
    output << "\n\n"
    block_count = 0
    month_count = 0
    month_block = []
    while block_count < 4
      if month_count == 0 || month_count%3 === 0
        output << HEADER[block_count]
        output << WEEKDAYS
      end
      month_count += 1
      @month = Month.new(month_count, @year)
      month_block << @month.build_month(month_count, @year)
      if month_count%3 === 0
        month1 = month_block[0].split("\n")
        month2 = month_block[1].split("\n")
        month3 = month_block[2].split("\n")
        0.upto(BLOCK_LENGTH-1) do |index|
          row_block = "#{month1[index]}".ljust(Month::LINE_LENGTH) + "\s\s"
          if month1[index] === nil && month2[index] === nil && month3[index] === nil
            row_block = "\n"
            if index == 4
              row_block << "\n"
              break
            end
          elsif month2[index] === nil && month3[index] === nil
            row_block = "#{month1[index]}" + "\n"
            if index == 4
              row_block << "\n"
              break
            end
          elsif month3[index] === nil
            row_block = "#{month1[index]}".ljust(Month::LINE_LENGTH) + "\s\s"
            row_block << "#{month2[index]}" + "\n"
            if index == 4
              row_block << "\n"
              break
            end
          elsif month1[index] === nil && month3[index] === nil && index == 5
            row_block = "#{month1[index]}".ljust(Month::LINE_LENGTH) + "\s\s"
            row_block << "#{month2[index]}\n\n"
            break
          else
            row_block = "#{month1[index]}".ljust(Month::LINE_LENGTH) + "\s\s"
            row_block << "#{month2[index]}".ljust(Month::LINE_LENGTH) + "\s\s"
            row_block << "#{month3[index]}" + "\n"
          end
          output << row_block
        end
        month_block = []
        block_count += 1
      end
    end
    output << "\n"
    output
  end

end
