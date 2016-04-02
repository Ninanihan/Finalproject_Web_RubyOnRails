class Comment < ActiveRecord::Base
  belongs_to :breeder
  belongs_to :user
end
