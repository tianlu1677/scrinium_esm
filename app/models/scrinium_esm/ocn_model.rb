module ScriniumEsm
  class OcnModel < ActiveRecord::Base
    validates :name, uniqueness: true
    validates :short_name, uniqueness: true
    validates :contact_id, presence: true
    translates :description

    has_many :experiments, as: :experimentable, dependent: :destroy

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
      :tripole,
      :rotation
    ].map { |x| I18n.t("ocn_model.horizontal_meshes.#{x}") }
    enum vertical_coordinate: [
      :height,
      :hybrid_sigma_height,
      :isopycnic
    ].map { |x| I18n.t("ocn_model.vertical_coordinates.#{x}") }
  end
end
