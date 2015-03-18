require "date_span/version"

module DateSpan
  def self.pluralize(start_date, end_date)

    return nil             if start_date > end_date
    return start_date.to_s if start_date == end_date

    start_date = start_date.to_s
    end_date   = end_date.to_s

    return "#{start_date}-#{end_date[3]}"    if start_date[0..2] == end_date[0..2]
    return "#{start_date}-#{end_date[2..3]}" if start_date[0..1] == end_date[0..1]

    return "#{start_date}-#{end_date}"

  end

  def self.singularize(date_span)
    date_span = date_span.split('-')
    raise 'The passed date span must contain a hyphen' if date_span.length == 1

    begin_date = date_span[0]
    end_date   = date_span[1]

    return [begin_date.to_i, begin_date.to_i] if begin_date.end_with? end_date 
    
    end_date_length = end_date.length

    return [begin_date.to_i, end_date.to_i] if end_date_length == 4

    end_date = "#{begin_date[0..3-end_date_length]}#{end_date}"

    return [begin_date.to_i, end_date.to_i]
  end
end
