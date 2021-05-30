require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'attributes' do
    it { expect(User.new).to respond_to(:name) }
    it { expect(User.new).to respond_to(:email) }
    it { expect(User.new).to respond_to(:country ) }
  end
end
