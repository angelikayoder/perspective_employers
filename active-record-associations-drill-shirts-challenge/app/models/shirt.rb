class Shirt < ActiveRecord::Base
  belongs_to :designer, class_name: "User", foreign_key: :designer_id
  has_many :sales, class_name: "Purchase", foreign_key: :shirt_id
  has_many :purchasers, through: :sales, foreign_key: :purchaser_id
end
