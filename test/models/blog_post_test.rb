# frozen_string_literal: true

require 'test_helper'

class BlogPostTest < ActiveSupport::TestCase
  test '#1 - should exist' do
    skip_if_under_step(1)

    assert Kernel.const_defined?('BlogPost')
    assert_includes BlogPost.ancestors, ApplicationRecord
  end

  test '#1 - should have the proper attributes' do
    skip_if_under_step(1)

    assert_equal %w[id title body created_at updated_at], BlogPost.new.attributes.keys
  end

  test '#1 - should be persisted in the database' do
    skip_if_under_step(1)

    title = Faker::App.name
    body = Faker::Lorem.paragraph
    blog_post = BlogPost.create!(title:, body:)

    assert_equal title, blog_post.title
    assert_equal body, blog_post.body
    blog_post.destroy!
  end
end
