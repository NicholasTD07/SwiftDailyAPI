require 'airborne'

Airborne.configure do |config|
  config.base_url = 'http://news.at.zhihu.com/api/4'
  config.headers = {
    'User-Agent': 'SwiftDailyAPI-api-specs'
  }
end

describe 'In latest news' do
  let(:date) { '20150101' }

  it 'date is date' do
    get '/news/latest'
    expect_json_types(
      date: :date,
      stories: :array_of_objects
    )
  end
end
