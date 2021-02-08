# frozen_string_literal: true

class PropertiesService
  def initialize(params = {})
    @params = params
  end

  def list
    list_properties
  end

  def retrieve
    retrieve_property
  end

  def create
    Property.create(@params)
  end

  def update
    retrieve_property.update(@params)
    retrieve_property
  end

  def destroy
    retrieve_property.destroy
  end

  private

  def list_properties
    Property.all
  end

  def retrieve_property
    Property.find(@params[:id])
  end
end