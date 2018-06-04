class Api::V1::SchoolsController < Api::ApiController

    api :GET, '/v1/schools', 'List schools'
    error code: 401
    def index
        @schools = School.filter(params)

    end

    def show
        @school = School.find(params[:id])
    end
end


# TODO :  un test qui test que si pas de token ou token invalid réponse 401 .
#           un test qui test le contraire
#           une route 
#       