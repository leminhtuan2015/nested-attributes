class SubjectsController < ApplicationController
 def index
   @subjects = Subject.all
 end

 def show
   @subject = Subject.find params[:id]
 end

 def new
   @subject = Subject.new
   3.times{ 
   @tasks = @subject.tasks.build
   }
 end

def create
  @subject = Subject.new subject_params
   if @subject.save
     redirect_to subjects_url
   else
     render 'new'
    end
end

  def update
    @subject = Subject.find params[:id]
    if @subject.update_attributes subject_params
      flash[:success] = "Information changed"     
      redirect_to subjects_url
    else
      render 'show'
    end
  end

  def destroy
    Subject.find(params[:id]).destroy
    flash[:success] = "Subject deleted"
    redirect_to subjects_url
  end

private
  def subject_params
    params.require(:subject).permit(:name, :description, tasks_attributes: [:id, :name])
  end

end
