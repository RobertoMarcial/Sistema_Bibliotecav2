module ApplicationHelper

     def error_message(model, item)
        error = model.errors[item].first
        return if error.nil?
        
        content_tag(:p, error, class: "is-invalid")
    end

    def input_error_class(model, item)
        error = model.errors[item].first
        return if error.nil? 
        "is-invalid"
    end


end
