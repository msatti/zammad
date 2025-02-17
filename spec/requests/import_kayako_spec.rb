# Copyright (C) 2012-2021 Zammad Foundation, http://zammad-foundation.org/

require 'rails_helper'

RSpec.describe 'ImportKayako', type: :request, set_up: false, authenticated_as: false, required_envs: %w[IMPORT_KAYAKO_ENDPOINT_SUBDOMAIN] do
  let(:action) { nil }
  let(:endpoint) { "/api/v1/import/kayako/#{action}" }

  describe 'POST /api/v1/import/kayako/url_check', :use_vcr do
    let(:action) { 'url_check' }

    it 'check invalid subdomain' do
      post endpoint, params: { url: 'https://reallybadexample.kayako.com' }, as: :json
      expect(json_response['result']).to eq('invalid')
    end

    it 'check valid subdomain' do
      post endpoint, params: { url: "https://#{ENV['IMPORT_KAYAKO_ENDPOINT_SUBDOMAIN']}.kayako.com" }, as: :json
      expect(json_response['result']).to eq('ok')
    end
  end
end
