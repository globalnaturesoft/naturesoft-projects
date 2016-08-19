module Naturesoft
  module Projects
    class ProjectsController < Naturesoft::FrontendController
      def projects_list
        @projects = Naturesoft::Projects::Project.order("created_at DESC")
      end
      def projects_detail
        @project = Naturesoft::Projects::Project.find(params[:project_id])
      end
    end
  end
end
