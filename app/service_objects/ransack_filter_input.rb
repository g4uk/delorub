class RansackFilterInput < Formtastic::Inputs::StringInput
  include ActiveAdmin::Inputs::Filters::Base

  def to_html
    input_wrapping do
      [
        label_html,
        builder.text_field(eq_input_name, input_html_options)
      ].join('\n').html_safe
    end
  end

  def eq_input_name
    "#{method}_eq"
  end

  def input_html_options
    opts = {}
    opts[:class] = ['select2-ransack-ajax'].concat([@options[:class]] || []).join(' ')
    opts['data-field'] = @options[:field] || 'by_search_in'
    opts['data-url'] = url
    opts['data-response_root'] = @options[:response_root] || @options[:url].to_s.split('/').last
    opts['data-display_name'] = @options[:display_name] || 'name'
    opts['data-minimum_input_length'] = @options[:minimum_input_length] || 1
    opts['data-width'] = @options[:width] || '100%'
    opts['data-selected'] = get_selected_value(opts['data-display_name'])
    super.merge opts
  end

  # rubocop:disable Style/RescueModifier
  def get_selected_value display_name
    filter_class = method.to_s.chomp('_id').classify.constantize rescue @object.klass
    selected_value = @object.conditions.find { |c| c.attributes.map(&:name).include?(method.to_s) }.values.first.value rescue nil
    filter_class.find(selected_value).send(display_name) if selected_value
  end

  def url
    if @options[:url].is_a?(Proc)
      template.instance_eval(&@options[:url]) || ''
    else
      @options[:url] || ''
    end
  end
end
