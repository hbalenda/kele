require 'httparty'
require 'json'
require './lib/roadmap'

class Kele
  include HTTParty
  include Roadmap
  base_uri 'https://www.bloc.io/api/v1'

  def initialize(email, password)
    post_response = self.class.post('/sessions',
    body: { email: email, password: password } )
    @auth_token = post_response['auth_token']
    if @auth_token.nil?
      puts "Sorry, invalid credentials."
    end
  end

  def get_me
    response = self.class.get('/users/me', headers: { "authorization" => @auth_token })
    @current_user = JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get("/mentors/#{mentor_id}/student_availability", headers: {"authorization" => @auth_token })
    @mentor_availability = JSON.parse(response.body)
  end

  def get_messages(page = 0)
    if page > 0
      request_url = "/message_threads?page=#{page}"
    else
      request_url = "/message_threads"
    end
    response = self.class.get(request_url, headers: { "authorization" => @auth_token })
    @messages = JSON.parse(response.body)
  end

  def create_message(user_id, recipient_id, subject, body)
    self.class.post("/messages",
    body: { user_id: user_id, recipient_id: recipient_id, subject: subject, stripped: body })
  end

  def create_submission (checkpoint_id, comment)
    @enrollment_id = self.get_me['id']
    self.class.post("/checkpoint_submissions",
    body: { checkpoint_id: checkpoint_id, comment: comment, enrollment_id: @enrollment_id })
  end
end
