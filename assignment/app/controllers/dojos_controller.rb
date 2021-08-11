class DojosController < ApplicationController

    def index
        @dojos = Dojo.all
        render "index"
    end
    
    def new
        # render 'new'
    end
    
    def show 
        @dojo = Dojo.find(params[:id])
        @students = @dojo.students
    end

    def edit
        @dojo = Dojo.find(params[:id])
        render 'edit'
    end

    def update
        @dojo = Dojo.find(params[:id])
        @dojo.update(dojo_params)
        @dojo.save
        redirect_to '/dojos'
    end

    def create
        Dojo.create(dojo_params)
        redirect_to '/dojos'
    end

    def destroy
        if Dojo.find(params[:id]).destroy
            flash[:success]= "Successfully deleted dojo"
        end
        redirect_to '/dojos'
    end

    private
        def dojo_params
            params.require(:dojo).permit(:branch,:street,:city,:satate)
        end
end
