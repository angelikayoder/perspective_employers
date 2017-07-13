class Purchase < ActiveRecord::Base
  belongs_to :purchaser, class_name: "User", foreign_key: :purchaser_id
  	belongs_to :shirt
end
