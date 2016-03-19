require 'httparty'

class Crowdbar < ActiveRecord::Base

  # Fetch the crowdbar stats
  def fetch_stats(url)
    @url     = url
    response = HTTParty.get(url)
    json     = JSON.parse(response.body)

    self.referal_count           = json['referal_count']
    self.seven_day_commission    = json['seven_day_commission']
    self.seven_day_referal_count = json['seven_day_referal_count']
    self.total_commission        = json['total_commission']
  end
end
