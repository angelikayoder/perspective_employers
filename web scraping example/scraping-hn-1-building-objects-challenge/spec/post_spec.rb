require_relative '../post'

describe Post do
  describe 'return basic data' do
    it 'returns id, target, time_ago, author_name' do
      post = Post.new("17","my_title", "www.com", "17 days ago", 1100, "Jim")
      details_array = [post.id, post.title, post.url, post.time_ago, post.author_points, post.author_name]
      expect(details_array).to match_array ["17","my_title", "www.com", "17 days ago", 1100, "Jim"]
    end
  end

  describe '#comments' do
    let(:post) { Post.new("17","my_title", "www.com", "17 days ago", 1100, "Jim") }
    let(:comment) { Comment.new("17","test","17 days ago", "Jim", "test") }
    context 'when no comments' do
      it 'returns empty array' do
        expect(post.comments).to eq []
      end
    end
    context 'when one comment' do
      it 'returns comment' do
        post.add_comment(comment)
        expect(post.comments).to eq [comment]
      end
    end
  end
  describe '#add_comment' do
    let(:post) { Post.new("17","my_title", "www.com", "17 days ago", 1100, "Jim") }
    let(:comment) { Comment.new("17","test","17 days ago", "Jim", "test") }
    it 'adds comment' do
      expect{post.add_comment(comment)}.to change{post.comments.length}.from(0).to(1)
    end
  end
end
