RSpec.shared_examples 'has date and stories' do
  it 'date is date' do
    expect_json_types(date: :date)
  end

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

