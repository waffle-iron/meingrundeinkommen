class Mailing < ActiveRecord::Base

  def self.all_newsletter_recipients
    where( newsletter = true, confirmed_at != nil)
  end

end
