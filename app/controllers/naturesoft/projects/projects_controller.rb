module Naturesoft
  module Projects
    class ProjectsController < Naturesoft::FrontendController
      def list
        @projects = Naturesoft::Projects::Project.order(custom_order: "asc")
      end
      def projects_detail
        @project = Naturesoft::Projects::Project.find(params[:project_id])
      end
    end
  end
end
