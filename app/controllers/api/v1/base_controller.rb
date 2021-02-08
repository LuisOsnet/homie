# frozen_string_literal: true

# This module contains APIs versions that we'll work along the way.
module Api
  # This module contains the API version 1 where we'll retrieve data from a
  # galaxy far far away.
  module V1
    # This class contains generic messages to show it in all request.
    class BaseController < ApplicationController
      before_action :authenticate_user!
      rescue_from 'ActionController::ParameterMissing',
                  with: :parameters_missing
      rescue_from 'ActiveRecord::RecordNotFound', with: :not_found
      # This method will show code 200 and the specific json when we'll
      # retrieve records.
      def response_success(data = {})
        if data.keys.any?
          render status: 200, json: data
        else
          render status: 204, json: {}
        end
      end

      # This method will show the 201 code when we have created new records
      def response_created(data = {})
        render status: 201, json: data
      end

      # Response error if something is missing
      def parameters_missing(error)
        response_error(code: 400, message: error.message)
      end

      # This method response with a message "not found" when the object doesn't
      # exist.
      def not_found
        response_error(code: 404, message: 'Object not found.')
      end

      # Response error message if something is wrong
      def response_error(args = {})
        opts = { code: 418 }.merge(args)
        opts[:message] ||= t("api.http_response.errors.error_#{opts[:code]}")

        render status: opts[:code], json: {
          error: opts[:message]
        }
      end

      private

      # Retrives autorization header from the request
      def auth_header
        request.headers['Authorization']
      end

      # This method decode bearer token and return just "JTI" token
      def decoded_token
        if auth_header
          token = auth_header.split(' ')[1]
          begin
            token = JWT.decode token, Rails.application.credentials.jwt_secret,
                                true,
                                { algorithm: 'HS256' }
            token&.first['jti']
          rescue JWT::DecodeError
            nil
          end
        end
      end

      # Retrieve the session owner base on "JTI" token
      def logged_user
        if decoded_token
          user_id = decoded_token[0].to_i
          @user = User.find user_id
        end
      end

      # It retrieves boolean answer to know if user is logged
      def logged_in?
        !!logged_user
      end

      def authenticate_user!
        if user_signed_in?
          @user = current_user
        else
          head :unauthorized
        end
      end
    end
  end
end
