class DateSpan

  def self.pluralize(start_date, end_date)

    return nil             if start_date > end_date
    return start_date.to_s if start_date == end_date

    start_date = start_date.to_s
    end_date   = end_date.to_s

    return "#{start_date}-#{end_date[3]}"    if start_date[0..2] == end_date[0..2]
    return "#{start_date}-#{end_date[2..3]}" if start_date[0..1] == end_date[0..1]

    return "#{start_date}-#{end_date}"

  end

end