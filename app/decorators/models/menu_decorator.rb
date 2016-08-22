Naturesoft::Menus::Menu.class_eval do
    @projects = {
      "list" => {
        "label" => "List",
        "controller" => "/naturesoft/projects/projects",
        "action" => "list",
        "params" => {
          "category_id" => nil,
          "per_page" => 10,
        }
      }
    }
end