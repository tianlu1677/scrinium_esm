module ScriniumEsm
  module ApplicationHelper
    def self.transform_params params, object, elements
      elements.each do |x|
        params[object][x] = params[object][x].to_i if params[object].has_key? x
      end
    end
  end
end
