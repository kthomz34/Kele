require 'httparty'

class Kele

  include HTTParty


  def initialize(email, password)
		response = self.class.post(api_end_point('/sessions'), body: { email: email, password: password })
		@auth_token = response["auth_token"]
  end

  def get_me
    response = self.class.get(api_end_point('/users/me'), headers: { "authorization" => @auth_token })
    @user_data = JSON.parse(response.body)
  end
  
  def get_mentor_availability(mentor_id)
    response = self.class.get(api_end_point("/mentors/#{mentor_id}/student_availability"), headers: { "authorization" => @auth_token })
    @mentor_availability = JSON.parse(response.body)
  end
  
  def get_roadmap(roadmap_id)
    response = self.class.get(api_end_point("/roadmaps/#{roadmap_id}"), headers: { "authorization" => @auth_token })
    @roadmap = JSON.parse(response.body)
  end
  
  def get_checkpoint(checkpoint_id)
    response = self.class.get(api_end_point("/checkpoints/#{checkpoint_id}"), headers: { "authorization" => @auth_token })
    @checkpoint = JSON.parse(response.body)
  end
  
  def get_messages(messages)
    response = self.class.get(api_end_point('/message_threads'), headers: { "authorization" => @auth_token })
    @message = JSON.parse(response.body)
  end
  
  def create_message(sender, recipient_id, token, subject, stripped_text)
    response = self.class.post(api_end_point('/messages'), body: { sender: sender, recipient_id: recipient_id, token: token, subject: subject, "stripped-text": stripped_text} , headers: { "authorization" => @auth_token })
    @create_message = JSON.parse(response.body)
  end

  private

  def api_end_point(end_point)
    "https://www.bloc.io/api/v1#{end_point}"
  end
end
