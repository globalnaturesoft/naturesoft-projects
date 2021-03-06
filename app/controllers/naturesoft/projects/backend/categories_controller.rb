module Naturesoft
  module Projects
    module Backend
      class CategoriesController < Naturesoft::Backend::BackendController
        before_action :set_category, only: [:show, :edit, :update, :destroy, :enable, :disable]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Categories Of Projects", naturesoft_projects.backend_categories_path
        end
    
        # GET /categories
        def index
          @categories = Category.search(params).paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /categories/1
        def show
          add_breadcrumb @category.name, naturesoft_projects.new_backend_category_path
          add_breadcrumb "Show"
        end
    
        # GET /categories/new
        def new
          @category = Category.new
          add_breadcrumb "New Category", naturesoft_projects.new_backend_category_path
        end
    
        # GET /categories/1/edit
        def edit
          add_breadcrumb @category.name, naturesoft_projects.new_backend_category_path
          add_breadcrumb "Edit"
        end
    
        # POST /categories
        def create
          @category = Category.new(category_params)
          @category.user = current_user
    
          if @category.save
            redirect_to backend_categories_path, notice: 'Category was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /categories/1
        def update
          if @category.update(category_params)
            redirect_to backend_categories_path, notice: 'Category was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /categories/1
        def destroy
          @category.destroy
          render text: 'Category was successfully destroyed.'
        end
        
        # ENABLE /categories/stutus
        def enable
          @category.enable
          render text: "Status was sucessfully enabled"
        end
        
        # DISABLE /categories/stutus
        def disable
          @category.disable
          render text: "Status was sucessfully disabled"
        end
        
        # DELETE /categories/delete?ids=1,2,3
        def delete
          @categories = Category.where(id: params[:ids].split(","))
          @categories.destroy_all
          render text: 'Categor(y/ies) was successfully destroyed.'
        end
        
        # GET /articles/select2
        def select2
          render json: Category.select2(params)
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_category
            @category = Category.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def category_params
            params.fetch(:category, {}).permit(:name, :description)
          end
      end
    end
  end
end
