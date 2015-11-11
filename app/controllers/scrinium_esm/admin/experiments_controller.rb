require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class Admin::ExperimentsController < ::Admin::ApplicationController

    defaults :route_prefix => 'admin'
    before_action :authenticate_user!

  end

  # you can visit it in main_app. Url is  /admin/esm/admin/experiments
end
