class NoteSerializer < ActiveModel::Serializer
  # attributes to be serialized
  attributes :id, :title, :text, :created_by, :created_at, :updated_at
  has_many :shares
end
