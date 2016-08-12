module Naturesoft
  module Projects
    module Admin
      class ProjectsController < Naturesoft::Admin::AdminController
        before_action :set_project, only: [:show, :edit, :update, :destroy, :enable, :disable]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Projects", naturesoft_projects.admin_projects_path
        end
    
        # GET /projects
        def index
          @projects = Project.search(params).paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /projects/1
        def show
          add_breadcrumb @project.name, naturesoft_projects.new_admin_project_path
          add_breadcrumb "Show"
        end
    
        # GET /projects/new
        def new
          @project = Project.new
          add_breadcrumb "New Project", naturesoft_projects.new_admin_project_path
        end
    
        # GET /projects/1/edit
        def edit
          add_breadcrumb @project.name, naturesoft_projects.new_admin_project_path
          add_breadcrumb "Edit"
        end
    
        # POST /projects
        def create
          @project = Project.new(project_params)
          @project.user = current_user
    
          if @project.save
            redirect_to admin_projects_path, notice: 'Project was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /projects/1
        def update
          if @project.update(project_params)
            redirect_to admin_projects_path, notice: 'Project was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /projects/1
        def destroy
          @project.destroy
          render text: 'Project was successfully destroyed.'
        end
        
        # ENABLE /partners/stutus
        def enable
          @project.enable
          render text: "Status was sucessfully enabled"
        end
        
        # DISABLE /partners/stutus
        def disable
          @project.disable
          render text: "Status was sucessfully disabled"
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_project
            @project = Project.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def project_params
            params.fetch(:project, {}).permit(:name,
              :discription,
              :website,
              :category_id,
              images_attributes: [:id, :user_id, :is_main, :image, :name, :_destroy]
            )
          end
      end
    end
  end
end
