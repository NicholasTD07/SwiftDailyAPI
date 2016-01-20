RSpec.shared_examples 'has comments' do
  it 'has comments' do
    expect_json_types(
      'comments.*',
      id: :int,
      author: :string,
      content: :string,
      likes: :int,
      time: :int, # timestamp
      avatar: :string # url
    )
  end
end
describe 'In a news\'s short comments' do
  before(:all) do
    get '/news/7190794/short-comments'
  end

  include_examples 'has comments'
end


describe 'In a news\'s long comments' do
  before(:all) do
    get '/news/7190794/long-comments'
  end

  include_examples 'has comments'
end
