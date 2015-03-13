class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy, :adding_new_user, :project_details]

  respond_to :html

  def index
    @projects = Project.all
    
  end

  def show
    @users = User.get_all_developers
    @project_members = @project.get_project_members
    respond_with(@project)
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.save
    respond_with(@project)
  end

  def update
    @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end

  def adding_new_user
      if @project.present?
          @project.users << User.where(:id => params["users"])
          @project_members = @project.get_project_members
      end
      respond_to :js
  end

  def project_details

  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description)
    end
end
