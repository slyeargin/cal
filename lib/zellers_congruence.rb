class ZellersCongruence

  def self.calculate(month, year, day=1)
    if month < 3
      month += 12
      year -= 1
    end
    (day + (((13 * (month+1))/ 5).floor) + (year % 100) + (((year % 100)/4).floor) + (((year / 100)/4).floor) + (5 * (year/100))) % 7
  end
end
