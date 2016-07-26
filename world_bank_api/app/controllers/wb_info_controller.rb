class WbInfoController < ApplicationController
   def index
     wb_infos = WbInfo.all

     render json: wb_infos
   end

   def create
     wb_info = WbInfo.new(wb_info_params)
    #  byebug
    puts wb_info
     if wb_info.save
       render json: {status: 201, success: true}
     else
       render json: {status: 400, success: false}
     end
   end

   def count
     count =  WbInfo.count

     render json: count
   end

   # get all region names excluding duplicates
   def unique_regions
    regions = WbInfo.uniq.pluck(:region)

    render json: regions
   end

   # only get regions that match the region name sent through in the uri
   def by_name
     wb_info = WbInfo.where(region: params[:name])

     render json: wb_info
   end

   private

   def wb_info_params
     params.require(:wb_info).permit(
        :region,
        :project_name,
        :project_abstract,
        :year,
        :loan_ammount
     )
   end
end
