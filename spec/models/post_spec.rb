require 'rails_helper'
$current_user = nil

RSpec.describe Post, type: :model do
  include UsersHelper
  let!(:current_user) { $current_user = mock_user }

  it 'has a title' do
    post = Post.new(
      title: '',
      body: 'valid body',
      user: current_user
    )
    expect(post).to_not be_valid

    post.title = 'Has a title'
    expect(post).to be_valid
  end

  it 'has a body' do
    post = Post.new(
      title: 'valid title',
      body: '',
      user: current_user
    )
    expect(post).to_not be_valid

    post.body = 'valid body'
    expect(post).to be_valid
  end

  it 'has a title of character length >= 3' do
    post = Post.new(
      title: '1',
      body: 'valid body',
      user: current_user
    )
    expect(post).to_not be_valid

    post.title = '123'
    expect(post).to be_valid
  end

  # TODO: split into multiple validations
  it 'has a body of character length >= 5 and <= 50' do
    post = Post.new(
      title: 'valid title',
      body: '123',
      user: current_user
    )
    expect(post).to_not be_valid

    post.body = 'valid body'
    expect(post).to be_valid

    fifty_char_string = 'hukTCrtriGoozbhe27utPCcsW9PCtyoMr6v4pM8jelcYQ2O1KG'
    post.body = fifty_char_string
    expect(post).to be_valid

    post.body = "#{fifty_char_string}a"
    expect(post).to_not be_valid
  end

  it 'has numerical views' do
    post = Post.new(
      title: 'valid title',
      body: 'valid body',
      user: current_user,
      views: 0
    )
    expect(post.views).to be_a(Integer)
  end
end
