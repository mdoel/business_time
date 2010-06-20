class String

  # time to float
  def t_to_f
    digits = self.split(':')
    digits.first.to_f + digits.last.to_f/60.0 
  end

  # to float range
  def to_fr
    limits = self.split("-").map do |l| 
      l =~ /(\d+):(\d+)/
      $1.to_f + $2.to_f/60.0
    end
    Range.new(*limits)
  end

end