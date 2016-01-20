describe 'In a news' do
  before(:all) do
    get '/news/7190794'
  end

  it 'id is int' do
    expect_json_types(id: :int)
  end

  it 'title is string' do
    expect_json_types(title: :string)
  end

  it 'body is string' do
    expect_json_types(body: :string)
  end

  it 'css are strings' do
    expect_json_types(css: :array_of_strings)
  end

  it 'image is string' do
    expect_json_types(image: :string)
  end

  it 'image_source is string' do
    expect_json_types(image_source: :string)
  end

  it 'share_url is string' do
    expect_json_types(share_url: :string)
  end
end
