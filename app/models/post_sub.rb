class PostSub < ActiveRecord::Base
  validates :post_id, :sub_id, presence: true

  belongs_to :posts
  belongs_to :subs
end
