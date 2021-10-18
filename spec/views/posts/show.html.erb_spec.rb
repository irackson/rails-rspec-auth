require 'rails_helper'
$current_user = nil

RSpec.describe 'posts/show', type: :view do
  include UsersHelper
  let!(:current_user) { $current_user = mock_user }

  before(:each) do
    @post = assign(:post, Post.create!(
                            title: 'Title',
                            body: 'MyText',
                            user: current_user,
                            views: 0
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/0/)
  end
end
