require "execjs"

module SamplesHelper
  def render_component(component_name, props)
    escaped_component_name = "\"#{component_name}\""
    props_as_json = props.to_json
    server_js_file = read_server_js()
    compiled_js = ExecJS.compile(server_js_file)
    componentDOM = compiled_js.eval("GLOBAL.renderComponent( #{escaped_component_name} , #{props_as_json} )")
    content_tag("div", raw(componentDOM));
  end

  def read_server_js
    begin
      server_js = File.open(Rails.root.join('app/assets/javascripts/server_side.js'))
      return file = File.read(server_js)
    rescue SystemCallError => e
      p "Error! #{e.class} #{e.message}"
    rescue IOError => e
      p "Error! #{e.class} #{e.message}"
    end
  end

end
