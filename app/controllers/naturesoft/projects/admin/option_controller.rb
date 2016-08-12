module Naturesoft
  module Projects
    module Admin
      class OptionsController < Naturesoft::Admin::AdminController
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Projects", naturesoft_projects.admin_projects_path
        end
    
        # GET /partners
        def index
          add_breadcrumb "Settings", nil
          
          @options = Naturesoft::Option.options("projects")
        end
      end
    end
  end
end
