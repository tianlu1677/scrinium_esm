ScriniumEsm::AtmModel.create(
  name: 'Grid-point Atmospheric Model IAP/LASG',
  short_name: 'GAMIL',
  contact_id: 1
)

ScriniumEsm::Experiment.create(
  name: '测试试验',
  contact_id: 1,
  experiment_type: 'amip',
  experimentable_type: 'ScriniumEsm::AtmModel',
  experimentable_id: 1
)

ScriniumEsm::Metric.create(
  name: 'Madden-Julian Oscillation',
  short_name: 'MJO',
  contact_id: 1
)

ScriniumEsm::ComparisonProject.create(
  name: 'Coupled Model Intercomparison Project',
  short_name: 'CMIP',
  description: 'The objective of the Coupled Model Intercomparison Project (CMIP) is to better understand past, present and future climate changes arising from either natural, unforced variability or in response to changes in radiative forcing in a multi-model context. This understanding includes assessments of model performance during the historical period and quantifications of the causes of the spread in future projections. Idealized experiments are also used to increase understanding of the model responses. In addition to these long time scale responses, experiments are performed to investigate the predictability of the climate system on various time and space scales as well as making predictions from observed climate states. An important part of CMIP is to make the multi-model output publically available in a standardized format.

CMIP began in 1995 under the auspices of the Working Group on Coupled Modelling (WGCM). The first set of common experiments involved comparing the model response to a idealized forcing, a constant rate of increase which was accomplished using a CO2 increase of 1% per year compounded. Since that time a number of CMIP experiments have been developed. The experiments continue to include integrations using idealized forcings to facilitate understanding. They now also include integrations forced with estimates of the changes in the historical radiative forcings as well as estimates of the future changes.

In addition to the major CMIP experiments, CMIP has also included a series of smaller model intercomparisons efforts design to understand specific aspects of the model response. These have been called the Coordinated CMIP Experiments. To date, two coordinated experiments have been run. One investigated the Atlantic Merdional Overturning Circulation (AMOC) (or thermohaline circulation - THC) response to changes in the surface fluxes of heat and water. The second Coordinated Experiment documented the model response to external surface water flux in high latitudes of the North Atlantic, the so-called water hosing experiments. A number of papers have been written using these datasets.',
  contact_id: 1
)
