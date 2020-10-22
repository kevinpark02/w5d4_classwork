# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require_relative 'shortened_url'

class User < ApplicationRecord
    validates :email, presence: true
    validates :email, uniqueness: true

    def self.create!(long_url)
        url = ShortenedUrl.random_code
        # ShortenedUrl.new(long_url, url, self.id)
    end

    has_many :submitted_urls,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :ShortenedUrl
end
