class School < ApplicationRecord
    def self.filter(params)
        out = []
        if params[:status].blank?
            out = School.all
        else 
            out = School.where(['status = ?', params[:status]])
        end

        return out.order("name ASC")
    end
end
  