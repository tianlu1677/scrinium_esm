module ScriniumEsm
  class AtmModel < ActiveRecord::Base
    validates :name, uniqueness: true
    validates :short_name, uniqueness: true
    validates :contact_id, presence: true
    translates :description

    enum simulation_region: [
      :global,
      :regional
    ].map { |x| I18n.t("model.simulation_regions.#{x}") }
    enum simulation_type: [
      :climate,
      :weather
    ].map { |x| I18n.t("model.simulation_types.#{x}") }
    enum horizontal_mesh: [
      :lat_lon,
      :cubed_sphere
    ].map { |x| I18n.t("atm_model.horizontal_meshes.#{x}") }
    enum vertical_coordinate: [
      :classic_sigma_pressure,
      :hybrid_sigma_pressure,
      :float_lagrangian_pressure
    ].map { |x| I18n.t("atm_model.vertical_coordinates.#{x}") }
  end
end
