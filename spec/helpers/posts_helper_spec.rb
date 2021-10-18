require 'rails_helper'
$creator = nil

RSpec.describe PostsHelper, type: :helper do
  include UsersHelper
  include PostsHelper
  let!(:creator) { $creator = mock_user }

  it 'attaches user to post' do
    @post = Post.new(title: 'MyValidTitle', body: 'MyValueText', views: 1)
    returned_post = assign_post_creator(@post, creator)
    expect(returned_post.user).to be(creator)
  end
end
