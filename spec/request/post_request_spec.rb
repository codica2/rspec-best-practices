require 'rails_helper'

RSpec.describe 'Post', type: :request do
  image = open(File.join(Rails.root, "/spec/files/test.jpg"))
  let!(:post) { create :post, featured_image: image }

  it 'show post by id' do
    get post_path(post)
    expect(response).to have_http_status(200)
    expect(response.body).to include(post.body)
  end

  it 'show all posts' do
    get posts_path
    expect(response).to have_http_status(200)
    expect(response.body).to include(post.title)
  end

end
