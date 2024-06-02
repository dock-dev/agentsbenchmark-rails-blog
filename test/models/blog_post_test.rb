# frozen_string_literal: true

require 'test_helper'

class BlogPostTest < ActiveSupport::TestCase
  test 'should exist' do
    assert Kernel.const_defined?('BlogPost')
    assert_includes BlogPost.ancestors, ApplicationRecord
  end

  test 'should have the proper attributes' do
    assert_equal %w[id title body created_at updated_at], BlogPost.new.attributes.keys
  end

  test 'should be persisted in the database' do
    title = Faker::App.name
    body = Faker::Lorem.paragraph
    blog_post = BlogPost.create!(title:, body:)

    assert_equal title, blog_post.title
    assert_equal body, blog_post.body
    blog_post.destroy!
  end
end
