require 'rails_helper'
$current_user = nil

RSpec.describe '/posts', type: :request do
  include UsersHelper
  let!(:current_user) { $current_user = mock_user }

  let(:valid_attributes) do
    { 'id' => '1',
      'title' => 'TitleTest',
      'body' => '54321' }
  end

  let(:invalid_attributes) do
    { 'id' => 'z',
      'title' => 'a',
      'body' => 'ab' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      post = Post.new(valid_attributes)
      post.user = current_user
      post.save
      get posts_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      post = Post.new(valid_attributes)
      post.user = current_user
      post.save
      get post_url(post)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'does not render a successful response when not logged in' do
      get new_post_url
      expect(response).to_not be_successful
    end
  end

  describe 'GET /edit' do
    it 'does not render a successful response when not logged in' do
      post = Post.new(valid_attributes)
      post.user = current_user
      post.save
      get edit_post_url(post)
      expect(response).to_not be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Post' do
        expect do
          post = Post.new(valid_attributes)
          post.user = current_user
          post.save
          post posts_url, params: { post: valid_attributes }
        end.to change(Post, :count).by(1)
      end
    end
  end
end
