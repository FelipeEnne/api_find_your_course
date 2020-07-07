require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:owner) }
  it { should validate_presence_of(:starts) }
  it { should validate_presence_of(:value) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:image) }
end
