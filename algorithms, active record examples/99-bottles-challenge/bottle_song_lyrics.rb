#Personally, I like my way better!!


  # 99.downto(1).each { |n| p "#{n} bottles of beer on the wall, #{n} bottles of beer. Take one down, pass it around, #{n - 1} bottles of beer on the wall!"}


# But I suppose I'll do it your way too
# Takes as its input an integer +n+ representing the starting number of bottles.
# Returns the lyrics to "n Bottles of Beer".

def bottle_song_lyrics(n)
  return unless n > 0
  # output = ""
  n.downto(1) { |n| p "#{n} bottles of beer on the wall, #{n} bottles of beer. Take one down, pass it around, #{n - 1} bottles of beer on the wall!"}
end

# p bottle_song_lyrics(99)
