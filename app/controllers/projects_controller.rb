class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy, :adding_new_user, :project_details]
  layout :apply_layout

  respond_to :html

  def index
    @projects = current_user.is_admin? ? (Project.all) : current_user.projects 
  end

  def show
    if current_user.is_admin? || (current_user.projects.map(&:id).include?(@project.id))
      @users = User.get_all_developers if current_user.is_admin?
      @project_members = @project.get_project_members if current_user.is_admin?
      respond_with(@project)
    else
      redirect_to root_path
    end
  end

  def new
    @project = Project.new
    respond_to :js if request.xhr?
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.save
    respond_to :js if request.xhr?
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

  def remove_allocated_user
    assignment = Project.find(params[:assignment_id])
    candidate = assignment.candidates.find(params[:candidate_ids])
    assignment.candidates.delete(candidate)
  end

  def submit_dev_timesheet
    Project.add_timmings_to_users(params, current_user)
    respond_to :js
  end

  private

  def apply_layout
    if current_user.is_admin?
      'admin_layout'
    else
      'user_layout'
    end
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :status, :total_hours)
  end
end
