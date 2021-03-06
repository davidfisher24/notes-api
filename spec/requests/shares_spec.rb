require 'rails_helper'

RSpec.describe 'Notes API', type: :request do
  # add notes owner
  let(:user) { create(:user) }
  let!(:notes) { create_list(:note, 10, created_by: user.id) }
  let(:note_id) { notes.first.id }
  # authorize request
  let(:headers) { valid_headers }

  describe 'GET /notes' do
    # update request with headers
    before { get '/notes', params: {}, headers: headers }

    it 'returns notes' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /notes/:id' do
    before { get "/notes/#{note_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the note' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(note_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:note_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Note/)
      end
    end
  end

  describe 'POST /notes' do
     let(:valid_attributes) do
      # send json payload
      { title: 'My First Note', text: 'A fantastic note', created_by: user.id.to_s }.to_json
    end

    context 'when request is valid' do
      before { post '/notes', params: valid_attributes, headers: headers }

      it 'creates a note' do
        expect(json['title']).to eq('My First Note')
        expect(json['text']).to eq('A fantastic note')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }
      before { post '/notes', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  describe 'PUT /notes/:id' do
    let(:valid_attributes) { { title: 'Shopping' }.to_json }

    context 'when the record exists' do
      before { put "/notes/#{note_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /notes/:id' do
    before { delete "/notes/#{note_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
