# == Schema Information
#
# Table name: chirps
#
#  id        :bigint           not null, primary key
#  body      :text             not null
#  author_id :integer          not null
#
class Chirp < ApplicationRecord
    validates :body, presence: true
    # validates :author_id, presence: true #belongs_to association automatically validates presence of author_id
    validate :body_too_long #custom validation, need to use validation

    # custom validation
    def body_too_long
        # check if body exists first
        if body && body.length > 140
            errors[:body] << 'is too long. Keep it short please.'
        end
    end

    # associations
    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User 
    # cannot do one-liner because foreign key author_id isn't the same as the class name.

    has_many :likes,
        foreign_key: :chirp_id,
        class_name: :Like

    has_many :likers,
        through: :likes,
        source: :liker
end
