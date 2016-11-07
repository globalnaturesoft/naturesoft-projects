Deface::Override.new(
                    :virtual_path => "backend/modules/_main_menu",
                    :name => "add_projets_categories_link_to_backend_nav",
                    :insert_after => "[data-naturesoft-hook='main_nav']",
                    :partial => "overrides/backend_projects_categories_link",
                    :namespaced => true,
                    :original => 'f5fe48b6dc6986328e0b873b3ffa1b228dd52a7c')