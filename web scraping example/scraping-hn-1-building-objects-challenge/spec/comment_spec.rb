require_relative '../comment'

describe Comment do
  describe 'return basic data' do
    it 'returns id, target, time_ago, author_name' do
      comment = Comment.new("17","test","17 days ago", "Jim","Stuff I said")
      details_array = [comment.id, comment.target_post, comment.time_ago, comment.author_name, comment.content]
      expect(details_array).to match_array ["17","test","17 days ago", "Jim","Stuff I said"]
    end
  end
end
