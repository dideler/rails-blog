class Post < ActiveRecord::Base
  # This class allows the updating of fields.

  has_many :comments, dependent: :destroy

  # We can validate data that we send to models.
  # E.g. All posts must have a title of at least 5 characters.
  validates :title, presence: true, length: { minimum: 5 }

  # Read more about Active Record validations:
  # http://guides.rubyonrails.org/active_record_validations.html
end
