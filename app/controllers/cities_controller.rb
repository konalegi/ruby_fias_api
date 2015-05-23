class CitiesController < Endive::Dispatch::BaseController

  def index
    if params[:query].blank? && params[:region].blank?
      @cities = City.preset
    else
      @cities = City.query(params[:query]).all_by_region(params[:region])
    end

    @cities =  @cities.page(params[:page]).per(params[:per]).all
  end

  def show
    @city = City.where(aoguid: params[:id]).first
  end

end