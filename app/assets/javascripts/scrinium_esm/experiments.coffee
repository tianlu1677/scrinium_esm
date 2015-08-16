# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

$(document).on 'page:change', ->
  atmModelIdInput = $('div#input-atm-model-id')
  ocnModelIdInput = $('div#input-ocn-model-id')
  coupledModelIdInput = $('div#input-coupled-model-id')
  atmModelIdInput.detach()
  ocnModelIdInput.detach()
  coupledModelIdInput.detach()
  switch $('select#input-experiment-type').val()
    when 'AMIP' then $('div#input-experiment-type').after(atmModelIdInput.show())
    when 'OMIP' then $('div#input-experiment-type').after(ocnModelIdInput.show())
    when 'CMIP' then $('div#input-experiment-type').after(coupledModelIdInput.show())
  $('select#input-experiment-type').change ->
    atmModelIdInput.detach()
    ocnModelIdInput.detach()
    coupledModelIdInput.detach()
    switch $('select#input-experiment-type').val()
      when 'AMIP' then $('div#input-experiment-type').after(atmModelIdInput.show())
      when 'OMIP' then $('div#input-experiment-type').after(ocnModelIdInput.show())
      when 'CMIP' then $('div#input-experiment-type').after(coupledModelIdInput.show())
