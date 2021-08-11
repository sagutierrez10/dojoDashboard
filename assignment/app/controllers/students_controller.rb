class StudentsController < ApplicationController
    def new
        @dojos = Dojo.all
        @dojo = Dojo.find(params[:dojo_id])
    end
    
    def show 
        @student = Student.find(params[:id])
        @dojo = Dojo.find(params[:dojo_id])
end
def edit
    @dojos = Dojo.all
    @student = Student.find(params[:id])
    @dojo = Dojo.find(params[:dojo_id])
    render 'edit'
end

def update
    @dojos = Dojo.all
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to "/dojos/#{params[:dojo_id]}/students/#{@student.id}"
end

def create
    @student= Student.create(student_params)
    redirect_to "/dojos/#{@student.dojo.id}"
end

def destroy
    @student= Student.find(params[:id])
    if @student.destroy
        flash[:success]= "Successfully deleted student"
    end
    redirect_to "/dojos/#{@student.dojo.id}"
end

private
        def student_params
            params.require(:student).permit(:first_name,:last_name,:email,:dojo_id)
        end
end