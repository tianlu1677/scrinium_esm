module ScriniumEsm
  class Engine < ::Rails::Engine
    isolate_namespace ScriniumEsm

    initializer :add_view_components_helper do |app|
      ActiveSupport.on_load :action_controller do
        helper ScriniumEsm::ViewComponentsHelper
      end
    end

    initializer :register_engine do |app|
      RailsEnginesHelper.register :scrinium_esm
    end
  end
end
