$(document).on 'page:change', ->
  if /\/metrics\/\d+$/.test(location)
    turnOnTab
      info: []
      resources: []
