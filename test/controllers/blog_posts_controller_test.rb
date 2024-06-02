# frozen_string_literal: true

require 'test_helper'

class BlogPostsControllerTest < ActionDispatch::IntegrationTest
  test '#2 should get index' do
    skip_if_under_step(2)

    get root_url

    assert_response :success
  end

  test '#3 - should get show' do
    skip_if_under_step(3)

    blog_post = FactoryBot.create(:blog_post)
    get blog_post_path(blog_post)

    assert_response :success
  end

  test '#3 - show should redirect to root_path if :id is not found' do
    skip_if_under_step(3)

    missing_blog_post_id = (BlogPost.maximum(:id) || 0).next
    get blog_post_path(missing_blog_post_id)

    assert_redirected_to root_path
  end

  test '#4 should get new' do
    skip_if_under_step(4)

    blog_post = FactoryBot.create(:blog_post)
    get new_blog_post_path(blog_post)

    assert_response :success
  end

  test '#5 - should post create' do
    skip_if_under_step(5)

    blog_post = FactoryBot.build(:blog_post)
    blog_post_params = blog_post.attributes.slice('title', 'body')
    post blog_posts_path(params: { blog_post: blog_post_params })
    created_blog_post = BlogPost.last

    assert_equal blog_post_params, created_blog_post.attributes.slice('title', 'body')
    assert_response :redirect
    assert_redirected_to blog_post_path(created_blog_post)
  end

  test '#5 - should bad_request if create failed' do
    skip_if_under_step(5)

    post blog_posts_path(params: {})
    assert_response :bad_request
  end

  test '#6 - should get edit' do
    skip_if_under_step(6)

    blog_post = FactoryBot.create(:blog_post)
    get edit_blog_post_path(blog_post)

    assert_response :success
  end

  test '#6 - edit should redirect to root_path if :id is not found' do
    skip_if_under_step(6)

    missing_blog_post_id = (BlogPost.maximum(:id) || 0).next
    get edit_blog_post_path(missing_blog_post_id)

    assert_redirected_to root_path
  end

  test '#7 - should patch update' do
    skip_if_under_step(7)

    blog_post = FactoryBot.create(:blog_post)
    blog_post_params = FactoryBot.build(:blog_post).attributes.slice('title', 'body')
    patch blog_post_path(id: blog_post.id, params: { blog_post: blog_post_params })

    assert_response :redirect
    blog_post.reload

    assert_equal blog_post_params, blog_post.attributes.slice('title', 'body')
    assert_redirected_to blog_post_path(blog_post)
  end

  test '#8 - should delete destroy' do
    skip_if_under_step(8)

    blog_post = FactoryBot.create(:blog_post)
    delete blog_post_path(blog_post)

    assert_empty BlogPost.all

    assert_response :redirect
    assert_redirected_to root_path
  end
end
