require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Sproutmark < OmniAuth::Strategies::OAuth2
      option :name, 'sproutmark'

      option :client_options, {
        :site => "https://www.sproutmark.com",
        :authorize_url => "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        {
          :first_name => raw_info["first_name"],
          :last_name => raw_info["last_name"],
          :email => raw_info["email"]
        }
      end

      extra do
        raw_info
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end

      # https://github.com/intridea/omniauth-oauth2/issues/81
      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
