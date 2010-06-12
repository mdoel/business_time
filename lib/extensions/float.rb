class Float
  
  # 18.5 => '18:30'
  def to_time
    dec = self - self.to_i
    min = (dec * 60).round
    
    min == 60 ? "#{self.to_i + 1}:00" : "#{self.to_i}:#{min}" 
  end
  
end