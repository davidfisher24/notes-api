require 'rails_helper'

RSpec.describe Share, type: :model do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:note) }
end
