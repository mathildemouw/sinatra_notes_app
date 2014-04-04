require 'spec_helper'

describe 'Index controller' do

  before do
    Note.find_by_content("I am a test note, how existential.") || Note.create(content: "I am a test note, how existential.")
  end

  describe 'GET /' do
    it 'should show the notes I\'ve written' do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to include("existential")
    end
  end

  # describe 'POST /notes/new' do
  #   it 'should create a new note' do
  #     post '/notes/new'
  #     expect(Note.count).to change
  #   end
  # end

  describe 'DELETE /notes/:id' do
    it 'should delete a note' do
      expect{delete "/notes/#{Note.first.id}"}.to change{Note.count}.by(-1)
    end
  end

end