require 'rails_helper'
$current_user = nil

RSpec.describe 'posts/new', type: :view do
  include UsersHelper
  let!(:current_user) { $current_user = mock_user }

  before(:each) do
    assign(:post, Post.new(
                    title: 'MyString',
                    body: 'MyText',
                    user: current_user
                  ))
  end

  it 'renders new post form' do
    render

    assert_select 'form[action=?][method=?]', posts_path, 'post' do
      assert_select 'input[name=?]', 'post[title]'

      assert_select 'textarea[name=?]', 'post[body]'
    end
  end
end
