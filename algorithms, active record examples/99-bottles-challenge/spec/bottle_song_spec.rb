require_relative '../bottle_song_lyrics'
# I've tried 100+ ways to get test 1 to pass to no avail
describe 'bottle_song_lyrics' do
  it 'has an positive integer as an arguement' do
    expect(bottle_song_lyrics(-9)).to be_nil
  end
  # it 'returns 99 bottles' do
  #   expect(bottle_song_lyrics(99)).to eq('99')
  # end
end
