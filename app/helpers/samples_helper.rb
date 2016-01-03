require "execjs"

module SamplesHelper
  def render_component(component_name, props, container_class)
    args = put_argument(component_name, props, container_class)
    server_js_file = load_server_js()
    compiled = ExecJS.compile(server_js_file)
    component_object = compiled.eval("GLOBAL.getComponentObject( #{args[:e_component_name]} , #{args[:j_props]} )")
    component_string = component_object["reactElementString"]
    script_tag = get_script_tag(args, component_object)
    content_tag(:div, raw(component_string), class: container_class) + content_tag(:script, raw(script_tag))
  end

  def put_argument(component_name, props, container_class)
    {
      component_name: component_name,
      props: props,
      container_class: container_class,
      e_component_name: wrap_with_double_quot(component_name),
      j_props: props.to_json,
      e_container_class: wrap_with_double_quot(container_class)
    }
  end

  def load_server_js
    begin
      server_js = File.open(Rails.root.join('app/assets/javascripts/server_side.js'))
      return file = File.read(server_js)
    rescue SystemCallError => e
      p "Error! #{e.class} #{e.message}"
    rescue IOError => e
      p "Error! #{e.class} #{e.message}"
    end
  end

  def get_script_tag(args, component_object)
    json_component = component_object.to_json
    "window.__reactComponents = window.__reactComponents || {} \n" +
    "window.__reactComponents.#{args[:component_name]} = {  \n" +
      "component :  #{json_component}, \n" +
      "props :  #{args[:j_props]}, \n" +
      "containerClass :  #{args[:e_container_class]} \n" +
    "}"
  end

  def wrap_with_double_quot(str)
    "\"#{str}\""
  end

end
