require 'spec_helper'

describe Kele, type: :request do
  describe '#initialize' do
    it 'authenticates the user', vcr: {cassette_name: :initialize} do
      kele = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
      expect(kele.instance_variable_get(:@auth_token)).to be_a String   
    end
    
    describe '#get_me' do
      
    end
    
    describe '#get_mentor_availability' do
     
    end
    
    describe '#get_roadmap' do
      
    end
    
    describe '#get_checkpoint' do
      
    end
    
    describe '#get_messages' do
      
    end
    
    describe '#create_message' do
      
    end
  end
end