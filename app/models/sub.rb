# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text             not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ActiveRecord::Base
  validates :title, :moderator_id, :description, presence: true

  belongs_to :user,
    foreign_key: :moderator_id

  has_many :posts
  has_many :postsubs
end
