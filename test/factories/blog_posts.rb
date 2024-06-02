# frozen_string_literal: true

FactoryBot.define do
  factory :blog_post do
    title { Faker::App.name }
    body { Faker::Lorem.paragraph }
  end
end
