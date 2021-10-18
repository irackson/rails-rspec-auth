require 'rails_helper'
$current_user = nil

RSpec.describe 'posts/index', type: :view do
  include UsersHelper
  let!(:current_user) { $current_user = mock_user }

  before(:each) do
    assign(:posts, [
             Post.create!(
               title: 'valid title',
               body: 'valid body',
               user: current_user,
               views: 20
             ),
             Post.create!(
               title: 'valid title',
               body: 'valid body',
               user: current_user,
               views: 10
             )
           ])
  end

  it 'renders a list of posts' do
    render
    assert_select 'tr>td', text: 'valid title'.to_s, count: 2
    assert_select 'tr>td', text: 'valid body'.to_s, count: 2
    assert_select 'tr>td', text: current_user.id.to_s, count: 2
    assert_select 'tr>td', text: 20.to_s, count: 1
    assert_select 'tr>td', text: 10.to_s, count: 1
  end
end
