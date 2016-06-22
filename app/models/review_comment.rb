class ReviewComment < ActiveRecord::Base
  belongs_to :review
  belongs_to :user
  validate :presence_of_body

  def presence_of_body
    if body.empty?
      errors[:no_comment] = "Comment field cannot be empty!"
    end
  end
end