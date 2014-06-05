class UpdatesController < ApplicationController
  
  def create
    @project = Project.find(params[:project_id])
    @update = @project.updates.create(update_params)
    redirect_to projects_path(@project)
  end
 
  private
    def comment_params
      params.require(:update).permit(:hours)
    end
  
end
