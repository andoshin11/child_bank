# class Api::Auth::RegistrationsController < ApplicationController
# end
module Api
  module Auth
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
      protect_from_forgery :except => [:create]

      private
      # :company( 企業名 )を追加できるようにpravateメソッドに修正を加える
      def sign_up_params
        params.permit(:name, :email, :password, :password_confirmation)
      end

      def account_update_params
        params.permit(:name, :email)
      end

    end
  end
end
