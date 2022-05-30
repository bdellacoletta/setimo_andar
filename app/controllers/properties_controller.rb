class PropertiesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @property = Property.new(property_params)
    @property.save
  end

  def edit
  end

  def update
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path
  end

  private

  def property_params
    params.require(:property).permit(:title, :description, :street_name, :city, :state, :country, :price)
  end
end
