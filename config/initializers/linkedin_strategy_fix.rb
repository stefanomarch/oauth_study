# frozen_string_literal: true

module OmniAuth
  module Strategies
    # likedin provider couldn t read the id_secret ,so added manually the client_secret to build the token 🥰
    class LinkedIn < OmniAuth::Strategies::OAuth2
      def token_params
        super.tap do |params|
          params.client_secret = options.client_secret
        end
      end
    end
  end
end
