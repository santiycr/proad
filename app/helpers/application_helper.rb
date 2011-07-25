module ApplicationHelper
  def nav_link(text, path)
    link_to(text, path, :class =>('current' if current_page? path))
  end

  def current_user
    session[:usuario]
  end

  def rol(permitido, no_admin=false)
    (current_user.rol == permitido or (current_user.rol == 'admin' and not no_admin))
  end
end

module ActionView
  module Helpers
    module FormOptionsHelper
      def slider(object_name, method, options = {}, html_options = {})
        html_options["style"] = "border:0;width:25px"
        min = (options[:min] or 1)
        max = (options[:max] or 5)
        step = (options.delete(:step) or 1)
        inverted = options.delete(:inverted) ? ((max + 1).to_s + ' -') : nil
        if range = options.delete("in") || options.delete("within")
          options.update("min" => range.min, "max" => range.max)
        end

        slider_js = "
$(function() {
  var slider = $('##{object_name.to_s.dup}_#{method.to_s.dup}_slider'),
      campo = $('##{object_name.to_s.dup}_#{method.to_s.dup}');
  slider.slider({
    value: #{inverted} campo.val(),
    min: #{min},
    max: #{max},
    step: #{step},
    slide: function( event, ui ) {
    campo.val(#{inverted} ui.value);
  }
});
campo.change(function(){slider.slider({'value': #{inverted} $(this).val()})});
});"
        
        (content_tag(:div,
                     "",
                     :id => "#{object_name}_#{method.to_s.dup}_slider",
                     :style => "width:200px;
                                margin:0 15px -3px 0;
                                display:inline-block;") +
         InstanceTag.new(object_name,
                         method,
                         self,
                         options.delete(:object))
                    .to_input_field_tag('text',
                                        html_options) +
         content_tag(:script,
                     slider_js,
                     :type => "text/javascript"))

      end
    end

    class FormBuilder
      def slider(method, options = {}, html_options = {})
        @template.slider(@object_name, method, objectify_options(options), @default_options.merge(html_options))
      end
    end
  end
end
