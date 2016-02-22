class Code < ActiveRecord::Base

  def self.get
    code      = where(used: false).order(id: :asc).limit(1).lock(true).first
    code.used = true
    code.save!
    code.code
  end

  def self.last
    where(used: true).order(id: :desc).limit(1).first
  end

end
