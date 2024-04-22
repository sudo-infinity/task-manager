# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      include BaseHandler
      include ExceptionHandler

      protected

      def index
        render json: resources
      end

      def create
        if new_resource.save
          render json: new_resource, status: :created
        else
          render json: { message: new_resource.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if resource.update(permitted_params)
          render json: resource
        else
          render json: { message: resource.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if resource.destroy
          render json: resource
        else
          render json: { message: resource.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        render json: serialized_collection
      end

      def resources
        @resources ||= model.all.order(created_at: :desc)
      end

      def resource
        @resource ||= model.find(params[:id])
      end

      def new_resource
        @new_resource ||= model.new(permitted_params)
      end

      def serialized_collection
        serialize(resource, serializer)
      end

      def serializer
        "#{model.name}Serializer".constantize
      end
    end
  end
end
