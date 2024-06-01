# frozen_string_literal: true

require 'test_helper'

class BlogPostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_url

    assert_response :success
  end

  test 'should get new' do
    blog_post = FactoryBot.create(:blog_post)
    get new_blog_post_path(blog_post)

    assert_response :success
  end

  test 'should get show' do
    blog_post = FactoryBot.create(:blog_post)
    get blog_post_path(blog_post)

    assert_response :success
  end

  test 'should post create' do
    blog_post = FactoryBot.build(:blog_post)
    blog_post_params = blog_post.attributes.slice('title', 'body')
    post blog_posts_path(params: { blog_post: blog_post_params })
    created_blog_post = BlogPost.last

    assert_equal blog_post_params, created_blog_post.attributes.slice('title', 'body')
    assert_response :redirect
    assert_redirected_to blog_post_path(created_blog_post)
  end

  test 'should bad_request if create failed' do
    post blog_posts_path(params: {})

    assert_response :bad_request
  end

  test 'show should redirect to root_path if :id is not found' do
    missing_blog_post_id = (BlogPost.maximum(:id) || 0).next
    get blog_post_path(missing_blog_post_id)

    assert_redirected_to root_path
  end
end
