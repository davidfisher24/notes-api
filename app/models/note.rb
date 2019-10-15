class Note < ApplicationRecord
  validates_presence_of :title, :text, :created_by
end
