$(document).on 'page:change', ->
  if /\/comparison_projects\/\d+$/.test(location)
    turnOnTab
      info: [],
      experiment_specs: [ 'add-experiment-spec' ]
      resources: [ 'add-resource' ]
