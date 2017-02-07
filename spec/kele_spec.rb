require 'spec_helper'


describe Kele, type: :request do
  let(:kele) { Kele.new(ENV['EMAIL'], ENV['PASSWORD']) }
  
  describe '#initialize' do
    it 'authenticates the user', vcr: {cassette_name: :initialize} do
      expect(kele.instance_variable_get(:@auth_token)).to be_a String   
    end
  end
    
  describe '#get_me' do
    it 'gets the user', vcr: {cassette_name: :get_me} do  
      me = kele.get_me
      expect(me).to be_a Hash
    end
  end
    
  describe '#get_mentor_availability' do
    it 'gets mentors availability', vcr: {cassette_name: :get_mentor_availability} do
      mentor_availability = kele.get_mentor_availability(ENV['MENTOR_ID'])
      expect(mentor_availability).to be_a Array
    end
  end
  
  describe '#get_roadmap' do
    it 'gets the roadmap', vcr: {cassette_name: :get_roadmap} do
      roadmap = kele.get_roadmap(31)
      expect(roadmap).to be_a Hash
    end
  end
  
  describe '#get_checkpoint' do
    it 'gets the checkpoint', vcr: {cassette_name: :get_checkpoint} do
      checkpoint = kele.get_checkpoint(2160)
      expect(checkpoint).to be_a Hash
    end
  end
  
  describe '#get_messages' do
    it 'gets the messages', vcr: {cassette_name: :get_messages} do
      messages = kele.get_messages(1)
      expect(messages).to be_a Hash
    end
  end
  
  describe '#create_message' do
    it 'creates a message', vcr: {cassette_name: :create_message} do
      created_message = kele.create_message("strong.bad@strongbadia.gov", 2, "abcd", "Royale with cheese", "That's what they call a quarter pounder in France.")
      expect(created_message).to_not be_nil
    end
  end
  
  describe '#create_submission' do
    it 'creates a submission', vcr: {cassette_name: :create_submission} do
      created_submission = kele.create_submission("assignment-22-iterative-search", "https:/github.com/me/repo/commit/5", 1635, "this is my work", 11218)
      expect(created_submission).to_not be_nil
    end
  end
end