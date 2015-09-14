ScriniumEsm::AtmModel.create(
  name: 'Grid-point Atmospheric Model IAP/LASG',
  short_name: 'GAMIL',
  contact_id: 1
)

ScriniumEsm::Experiment.create(
  name: '测试试验',
  contact_id: 1,
  experimentable_type: 'ScriniumEsm::AtmModel',
  experimentable_id: 1
)

ScriniumEsm::Metric.create(
  name: 'Madden-Julian Oscillation',
  short_name: 'MJO',
  contact_id: 1
)
