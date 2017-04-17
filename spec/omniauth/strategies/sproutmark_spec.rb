require 'spec_helper'
require 'omniauth-sproutmark'

describe OmniAuth::Strategies::Sproutmark do
  subject { OmniAuth::Strategies::Sproutmark.new(nil) }

  it 'should add a camelization for itself' do
    expect(OmniAuth::Utils.camelize('sproutmark')).to eq('Sproutmark')
  end

  describe '#client' do
    it 'has correct Sproutmark site' do
      expect(subject.client.site).to eq('https://www.sproutmark.com')
    end

    it 'has correct authorize url' do
      expect(subject.client.options[:authorize_url]).to eq('/oauth/authorize')
    end

    it 'has correct token url' do
      expect(subject.client.options[:token_url]).to eq('/oauth/token')
    end
  end

  describe '#callback_path' do
    it 'has the correct callback path' do
      expect(subject.callback_path).to eq('/auth/sproutmark/callback')
    end
  end

  describe '#uid' do
    before :each do
      allow(subject).to receive(:raw_info) { { 'id' => 'uid' } }
    end

    it 'returns the id from raw_info' do
      expect(subject.uid).to eq('uid')
    end
  end

  describe '#info' do
    before :each do
      allow(subject).to receive(:raw_info) { {} }
    end

    context 'and therefore has all the necessary fields' do
      it { expect(subject.info).to have_key :email }
      it { expect(subject.info).to have_key :first_name }
      it { expect(subject.info).to have_key :last_name }
    end
  end


  describe '#raw_info' do
    before :each do
      access_token = double('access token')
      response = double('response', :parsed => { :foo => 'bar' })
      expect(access_token).to receive(:get).with("/api/v1/me.json").and_return(response)

      allow(subject).to receive(:option_fields) { ['baz', 'qux'] }
      allow(subject).to receive(:access_token) { access_token }
    end

    it 'returns parsed response from access token' do
      expect(subject.raw_info).to eq({ :foo => 'bar' })
    end
  end

end