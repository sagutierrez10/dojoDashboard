class DojosController < ApplicationController

    def index
        @dojos = Dojo.all
        render "index"
    end
    
    def new
        # render 'new'
    end
    
    def create
        Dojo.create(dojo_params)
        redirect_to '/dojos'
    end
    private
        def dojo_params
            params.require(:dojo).permit(:branch,:street,:city,:satate)
        end
end
