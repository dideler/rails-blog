class Comment < ActiveRecord::Base
  belongs_to :post  # Sets up association.
end
