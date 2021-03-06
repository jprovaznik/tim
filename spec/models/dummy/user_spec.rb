require 'spec_helper'

describe User do
  describe "Dummy Model relationships" do
    it 'should have many base images' do
      user = User.new
      2.times do
        user.base_images << Tim::BaseImage.new
      end
      user.save!
      User.find(user).base_images.size.should == 2
    end
  end
end
