$(document).on 'page:change', ->
  if /\/experiment_specs\/\d+$/.test(location)
    turnOnTab
      info: []
      resources: [ 'add-resource' ]
