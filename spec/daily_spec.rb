describe 'In news on a date' do
  before(:all) do
    get '/news/before/20160101'
  end

  include_examples 'has date and stories'
end
