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
end
