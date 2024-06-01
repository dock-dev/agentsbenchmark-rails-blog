# frozen_string_literal: true

require 'test_helper'

class BlogFlowsTest < ActionDispatch::IntegrationTest
  test 'index displays all blog posts' do
    blog_posts = FactoryBot.create_list(:blog_post, 3)
    visit root_url

    blog_posts.each do |blog_post|
      assert_text blog_post.title
      assert_text blog_post.body
    end
  end

  test 'show displays a blog post' do
    blog_post = FactoryBot.create(:blog_post)
    visit blog_post_path(blog_post)

    assert_text blog_post.title
    assert_text blog_post.body
  end

  test 'new displays a blog post form' do
    visit new_blog_post_path

    assert_field 'blog_post_title'
    assert_field 'blog_post_body'
  end

  test 'submitting a new blog_post redirects to the show view' do
    blog_post = FactoryBot.build(:blog_post)
    visit new_blog_post_path(blog_post)

    fill_in 'blog_post_title', with: blog_post.title
    fill_in 'blog_post_body', with: blog_post.body
    click_on 'Create Blog post'

    assert_current_path blog_post_path(BlogPost.last)
    assert_text blog_post.title
    assert_text blog_post.body
  end
end
