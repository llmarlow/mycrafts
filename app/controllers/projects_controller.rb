class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = current_user.projects.build
  end

  def edit
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
    end

    def correct_user
      @project = current_user.projects.find_by(id: params[:id])
      redirect_to projects_path, notice: "Not authorized to edit this project" if @project.nil?
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :width, :height, :project_type, :fabric_type, :fabric_count, :fabric_colour, :thread_type, :finished_image)
    end
end
