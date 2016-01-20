describe 'In a news-extra' do
  before(:all) do
    get '/news-extra/7190794'
  end

  it 'popularity is int' do
    expect_json_types(popularity: :int)
  end

  it 'short_comments is int' do
    expect_json_types(short_comments: :int)
  end

  it 'long_comments is int' do
    expect_json_types(long_comments: :int)
  end

  it 'comments is int' do
    expect_json_types(comments: :int)
  end
end
