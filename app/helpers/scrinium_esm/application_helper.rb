module ScriniumEsm
  module ApplicationHelper
    def self.transform_params params, object, elements
      elements.each do |x|
        params[object][x] = params[object][x].to_i if params[object].has_key? x
      end
    end

    def method_missing method, *args, &block
      if method.to_s.end_with?('_path') or method.to_s.end_with?('_url')
        if main_app.respond_to?(method)
          main_app.send(method, *args)
        else
          super
        end
      else
        super
      end
    end

    def respond_to?(method)
      if method.to_s.end_with?('_path') or method.to_s.end_with?('_url')
        if main_app.respond_to?(method)
          true
        else
          super
        end
      else
        super
      end
    end
  end
end
