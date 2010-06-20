class Hash
  # in order to save a time description like Fridays from 9-12 and 15 and Tuesdays at 9-10 and 18-22
  # a hash can be used like this { 'Friday' => ['09:00 - 12:00', '15:00'], 'Tuesday' => ['09:00 - 10:00', '18:00-22:00'] }
  # includes_date? is an instance method that you pass a date and it will return true
  # if the date matches the hash's time description

  def include_date?(date)
    # check if the hash has a day entry for the date's day
    date = Time.zone.parse(date.to_s); i = 0
    while i < 7
      times = self[date.strftime('%A').to_sym]

      if times # e.g. ['09:00 - 12:00', '15:00 - 18:00', '19:15']
        if i == 0 && result = self.match?(date, times)
          return result
        else
          next_time = times.map do |time|
            begin
              time = time.split('-').first
              min = date.strftime("%m/%d/%Y #{time}")
              Time.zone.parse(min)
            end
          end.select {|time| time > date}.sort.first
          return [false, next_time] if next_time
        end
      end # if times
      date = date.beginning_of_day + 1.day
      i += 1
    end #while
  end


  def match?(date, times)
    hour = date.strftime('%H').to_i
    minutes = (date.strftime('%M').to_i)/60.0
    float_time = hour + minutes # termin time 
    match = false

    times.each do |time|
      # either e.g. range '14:15 - 16:00' or single time '14:30'
      float_range = time.split('-').map {|time| time.t_to_f}
      float_range = float_range.first..float_range.last
      
      # floats 14.25..16.0 or 14.5
      if float_range.include?(float_time)
        match = [float_range.begin, float_range.end].map do |float|
          border = date.strftime("%m/%d/%Y #{float.to_time}")
          Time.zone.parse(border)  
        end
        break 
      end
    end
    match
  end

  alias_method :includes_date?, :include_date?
end