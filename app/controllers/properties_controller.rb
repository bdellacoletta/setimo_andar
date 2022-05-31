class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    properties = Property.all

    @properties = properties.select do |property|
      property.sales.ids == []
    end
  end

  def show
    @property = Property.find(params[:id])
    @sale = Sale.new
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save
      redirect_to property_path(@property)
    else
      render :new
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    @property.update(property_params)

    redirect_to properties_path
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
