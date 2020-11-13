module ApplicationHelper
    def link_to_add_fields(name, f, association, opts={})
        new_object = f.object.class.reflect_on_association(association).klass.new
           fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
           # render partial: _task_fields.html.erb
           render("crud/actividad/" + association.to_s.singularize + "_fields", f: builder)
         end
         link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\");return false;"))
     end
  
     def link_to_function(name, js, opts={})
          link_to name, '#', opts.merge({onclick: js})
     end


     def link_to_add_adic(name, f, association, opts={})
        new_object = f.object.class.reflect_on_association(association).klass.new
           fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
           # render partial: _task_fields.html.erb
           render("tecnico/" + association.to_s.singularize + "_fields", f: builder)
         end
         link_to_functionadic(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\");return false;"))
     end
  
     def link_to_functionadic(name, js, opts={})
          link_to name, '#', opts.merge({onclick: js})
     end
end
