require 'airborne'

Airborne.configure do |config|
  config.base_url = 'http://news.at.zhihu.com/api/4'
  config.headers = {
    'User-Agent': 'SwiftDailyAPI-api-specs'
  }
end

describe 'In latest news' do
  let(:date) { '20150101' }
  before(:all) do
    get '/news/latest'
  end

  it 'date is date' do
    expect_json_types(date: :date)
  end

  it 'stories are objects' do
    expect_json_types(stories: :array_of_objects)
  end
end
