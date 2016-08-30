module Naturesoft::Projects
  class Project < ApplicationRecord
		include Naturesoft::CustomOrder
		
    belongs_to :user
    belongs_to :category
    has_many :images, dependent: :destroy, :inverse_of => :project
    accepts_nested_attributes_for :images,
			:reject_if => lambda { |a| a[:image].blank? && a[:id].blank? },
			:allow_destroy => true
    
    def self.sort_by
      [
				["Custom order","naturesoft_projects_projects.custom_order"],
        ["Name","naturesoft_projects_projects.name"],
        ["Created At","naturesoft_projects_projects.created_at"]
      ]
    end
    def self.sort_orders
      [
        ["ASC","asc"],
        ["DESC","desc"]
      ]
    end
    
    #Filter, Sort
    def self.search(params)
      records = self.all
      
      #Search keyword filter
      if params[:keyword].present?
        params[:keyword].split(" ").each do |k|
          records = records.where("LOWER(CONCAT(naturesoft_projects_projects.name,' ',naturesoft_projects_projects.description)) LIKE ?", "%#{k.strip.downcase}%") if k.strip.present?
        end
      end
      
      # for sorting
      sort_by = params[:sort_by].present? ? params[:sort_by] : "naturesoft_projects_projects.name"
      sort_orders = params[:sort_orders].present? ? params[:sort_orders] : "asc"
      records = records.order("#{sort_by} #{sort_orders}")
      
      return records
    end
    
    # enable/disable status
    def enable
			update_columns(status: "active")
		end
    
    def disable
			update_columns(status: "inactive")
		end
    
    # get newest default image
    def main_image
			return Image.new if images.empty?
			
			img = images.where(is_main: true).last
			return img.nil? ? images.last : img
		end
  end
end
