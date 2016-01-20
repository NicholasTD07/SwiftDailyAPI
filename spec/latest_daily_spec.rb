describe 'In latest news' do
  before(:all) do
    get '/news/latest'
  end

  include_examples 'has date and stories'

  it 'top stories are of type TopNewsMeta' do
    expect_json_types(
      'top_stories.*',
      id: :int,
      title: :string,
      image: :string, # image url
    )
  end
end
