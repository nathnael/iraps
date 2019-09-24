

class CustomFormBuilder  < ActionView::Helpers::FormBuilder
 
  def date_field(method, locale, user, options = {})

       if (locale =='am' || user.language=='am' ) 
           options[:class] = options[:class] + " custom_datepicker"
           #options[:value] = '01/01/2017'
         else
            options[:class] = options[:class] + " datepicker "
           end

          @template.text_field(@object_name,method, options)
         
     
    end
end

