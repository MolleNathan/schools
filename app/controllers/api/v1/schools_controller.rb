class Api::V1::SchoolsController < Api::ApiController

    api :GET, '/v1/schools', 'List schools'
    error code: 401
    def index
        @schools = School.filter(params)

    end

    def show
        @school = School.find(params[:id])
    end

    def create 
        @school = School.create(school_params)
        
        if @school.errors.any?
            render json: {success: false, errors: @school.errors.messages}.to_json, status: 422
        else
            render template: 'api/v1/schools/show', status: 201
        end
    end

    def update
        if @school.update(school_params)
          render template: '/api/v1/schools/show', status: 200
        end
    end

    def destroy
        @success = false
        if (@school)
          @school.destroy
          @success = true
        end
    end

    private
    def school_params

        params.require(:school).permit(
            :name,
            :adress,
            :email,
            :city,
            :phone_number,
            :schedule,
            :zip_code,
            :latitude,
            :longitude,
            :status,
            :nb_student
        )
    end
end


# TODO :  un test qui test que si pas de token ou token invalid réponse 401 .
#           un test qui test le contraire
#           une route 
#       