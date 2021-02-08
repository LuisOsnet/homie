# frozen_string_literal: true

module Api
  module V1
    class PropertiesController < Api::V1::BaseController
      def index
        response = properties_service({}).list
        if response
          response_success properties: response
        else
          not_found
        end
      end

      def show
        response = properties_service({ id: params[:id] }).retrieve
        if response
          response_success property: response
        else
          not_found
        end
      end

      def create
        response = properties_service(filtered_params).create
        if response
          response_created property: response
        else
          not_found
        end
      end

      def update
        response = properties_service(filtered_params).update
        if response
          response_success property: response
        else
          not_found
        end
      end

      def destroy
        response = properties_service({ id: params[:id] }).destroy
        if response
          response_success
        else
          not_found
        end
      end

      def availables_properties
        response = properties_service(filtered_params).published
        if response
          response_success properties: response
        else
          not_found
        end
      end

      private

        # Initialize service
        def properties_service(filtered_params)
          @properties_service ||= PropertiesService.new(filtered_params)
        end

        # This method filters out the needed parameters to user.
        def filtered_params
          params.require(:property).permit(
            :name,
            :description,
            :price,
            :status,
            :owner_name,
            :owner_phone,
            attributes: []
          ).merge(id: params[:id])
        end
    end
  end
end
