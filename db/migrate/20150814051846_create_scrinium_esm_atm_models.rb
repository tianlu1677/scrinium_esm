class CreateScriniumEsmAtmModels < ActiveRecord::Migration
  def up
    create_table :scrinium_esm_atm_models do |t|
      t.string  :name                          # 模式名称
      t.string  :short_name                    # 模式简称
      t.text    :description                   # 模式简介
      t.integer :contact_id                    # 联系人ID
      t.integer :organization_id               # 关联机构ID
      t.string  :repository_url                # 版本库地址
      t.string  :affiliation                   # 实际归属机构
      t.string  :simulation_region             # 模拟区域
      t.string  :simulation_type               # 模拟类型
      # Atmosphere model specific columns.
      t.boolean :is_hydrostatic                # 是否采用静力平衡假设
      t.boolean :is_shallow                    # 是否采用浅层假设
      t.string  :horizontal_mesh               # 水平网格
      t.string  :vertical_coordinate           # 垂直坐标
      t.string  :vertical_mesh                 # 垂直网格
      t.string  :dynamical_core_scheme         # 动力框架方案名称
      t.string  :advection_scheme              # 平流方案名称
      t.string  :radiation_scheme              # 辐射传输参数化方案名称
      t.string  :convection_scheme             # 对流参数化方案名称
      t.string  :microphysics_scheme           # 云微物理参数方案名称
      t.string  :planet_boundary_layer_scheme  # 边界层参数化方案名称
      t.string  :gravity_drag_scheme           # 重力波拖曳参数化方案名称

      t.timestamps null: false
    end
  end
end
