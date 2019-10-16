class Note < ApplicationRecord
  validates_presence_of :title, :text, :created_by
  has_many :shares, dependent: :delete_all
end
