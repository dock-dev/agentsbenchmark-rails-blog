# frozen_string_literal: true

require 'test_helper'

class BlogFlowsTest < ActionDispatch::IntegrationTest
  test '#2 - index displays all blog posts' do
    skip_if_under_step(2)

    blog_posts = FactoryBot.create_list(:blog_post, 3)
    visit root_url

    blog_posts.each do |blog_post|
      assert_text blog_post.title
      assert_text blog_post.body
    end
  end

  test '#3 - show displays a blog post' do
    skip_if_under_step(3)

    blog_post = FactoryBot.create(:blog_post)
    visit blog_post_path(blog_post)

    assert_text blog_post.title
    assert_text blog_post.body
  end

  test '#4 - new displays a blog post form' do
    skip_if_under_step(4)

    visit new_blog_post_path

    assert_field 'blog_post_title'
    assert_field 'blog_post_body'
  end

  test '#5 - submitting a new blog_post redirects to the show view' do
    skip_if_under_step(5)

    blog_post = FactoryBot.build(:blog_post)
    visit new_blog_post_path(blog_post)

    fill_in 'blog_post_title', with: blog_post.title
    fill_in 'blog_post_body', with: blog_post.body
    click_on 'Create Blog post'

    assert_current_path blog_post_path(BlogPost.last)
    assert_text blog_post.title
    assert_text blog_post.body
  end

  test '#6 - edit displays a blog post form' do
    skip_if_under_step(6)

    blog_post = FactoryBot.create(:blog_post)
    visit edit_blog_post_path(blog_post)

    assert_field 'blog_post_title'
    assert_field 'blog_post_body'
  end

  test '#7 - updating a blog_post redirects to the show view' do
    skip_if_under_step(7)

    blog_post = FactoryBot.create(:blog_post)
    updated_blog_post = FactoryBot.build(:blog_post)
    visit edit_blog_post_path(blog_post)

    fill_in 'blog_post_title', with: updated_blog_post.title
    fill_in 'blog_post_body', with: updated_blog_post.body
    click_on 'Update Blog post'

    assert_current_path blog_post_path(blog_post)
    assert_text updated_blog_post.title
    assert_text updated_blog_post.body
  end

  test '#8 - deleting a blog_post redirects to root' do
    skip_if_under_step(8)

    blog_post = FactoryBot.create(:blog_post)
    visit edit_blog_post_path(blog_post)
    click_on 'Destroy'

    assert_empty BlogPost.all
    assert_current_path root_path
  end
end
