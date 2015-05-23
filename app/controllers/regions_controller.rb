class RegionsController < Endive::Dispatch::BaseController
 def index

    if params[:query].blank?
      @regions = Region.order(:ordering)
    else
      @regions =  Region.query(params[:query])
    end

    @regions = @regions.page(params[:page]).per(params[:per])
  end
end
