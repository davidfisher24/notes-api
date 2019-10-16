class Share < ApplicationRecord
  belongs_to :user
  belongs_to :note
  validates_uniqueness_of :note_id, :scope => [:user_id]
end
