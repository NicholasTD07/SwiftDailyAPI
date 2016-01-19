describe 'In news on a date' do
  before(:all) do
    get '/news/before/20160101'
  end

  it 'date is date' do
    expect_json_types(date: :date)
  end

  # The next two `it` blocks are copied from `./latest_daily_spec.rb`
  # "Copy and paste" is a bad thing in general.
  # BUT, in testing, it's not as bad as in application code.
  # AND, this duplication only happens once,
  # `stories` in `news/latest` and `news/befroe/date`.
  it 'stories are objects' do
    expect_json_types(stories: :array_of_objects)
  end

  it 'stories are of type NewsMeta' do
    expect_json_types(
      'stories.*',
      id: :int,
      title: :string,
      images: :array_of_strings, # image urls
      ga_prefix: :string # converted into Int in SDAPI
    )
  end

end
