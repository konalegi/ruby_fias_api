class StreetsController < Endive::Dispatch::BaseController

  def index
    @streets = Street.query(params[:query]).all_by_parent(params[:city]).page(params[:page]).per(params[:per]).all
  end

  def show
    @street = Street.where(aoguid: params[:id]).first
  end

end