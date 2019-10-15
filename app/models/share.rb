class Share < ApplicationRecord
  belongs_to :user, dependent: :delete
  belongs_to :note, dependent: :delete
  validates_presence_of :user, :note
end
