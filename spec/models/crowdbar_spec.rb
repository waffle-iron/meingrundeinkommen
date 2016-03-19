require 'rails_helper'

RSpec.describe Crowdbar, type: :model do
  it 'retrieves the crowdbar data as json' do
    crowdbar = Crowdbar.new
    # TODO: Mock this. Maybe use VCR?
    crowdbar.fetch_stats('https://bar.mein-grundeinkommen.de/crowd_bar_stats.json')

    # expect(crowdbar.referal_count).to eq(217443)
    # expect(crowdbar.seven_day_commission).to eq(217443)
    # expect(crowdbar.seven_day_referal_count).to eq(217443)
    # expect(crowdbar.total_commission).to eq(217443)
  end
end
