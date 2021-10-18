require 'rails_helper'
$current_user = nil

RSpec.describe 'posts/edit', type: :view do
  include UsersHelper
  let!(:current_user) { $current_user = mock_user }

  before(:each) do
    @post = assign(:post, Post.create!(
                            title: 'valid title',
                            body: 'valid body',
                            user: current_user,
                            views: 1
                          ))
  end

  it 'renders the edit post form' do
    render

    assert_select 'form[action=?][method=?]', post_path(@post), 'post' do
      assert_select 'input[name=?]', 'post[title]'

      assert_select 'textarea[name=?]', 'post[body]'
    end
  end
end
