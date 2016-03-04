class Setting < ActiveRecord::Base

  def self.get(name)
    where(name: name).first.value
  end

end
