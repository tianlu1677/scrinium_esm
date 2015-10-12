# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

content1WhiteList = [
  'parameter:change', 'parameter:add', 'parameter:delete',
  'compiler:change',
  'compiler_option:change', 'compiler_option:add', 'compiler_option:delete'
  'code:change'
]
content2WhiteList = [
  'parameter:change', 'parameter:add'
  'compiler:change',
  'compiler_option:change', 'compiler_option:add', 'compiler_option:delete'
]
content3WhiteList = [
  'parameter:change',
  'compiler:change',
  'compiler_option:change'
]
content4WhiteList = [
  'code:change'
]
content5WhiteList = [
  'code:change'
]

showActionContentFields = (action_id, action_object, action_type) ->
  tmp = "#{action_object}:#{action_type}"
  $("#experiment_experiment_actions_attributes_#{action_id}_content1").toggle(tmp in content1WhiteList)
  $("#experiment_experiment_actions_attributes_#{action_id}_content2").toggle(tmp in content2WhiteList)
  $("#experiment_experiment_actions_attributes_#{action_id}_content3").toggle(tmp in content3WhiteList)
  $("#experiment_experiment_actions_attributes_#{action_id}_content4").toggle(tmp in content4WhiteList)
  $("#experiment_experiment_actions_attributes_#{action_id}_content5").toggle(tmp in content5WhiteList)

$(document).on 'page:change', ->
  if /\/experiments\/\d+$/.test(location)
    turnOnTab
      info: []
      logs: [ 'add-log' ]
      diagnostic_results: [ 'add-diagnostic-result' ]
      ensemble_members: [ 'add-ensemble-member' ]
    $('#use-experiment-action-table-list').click ->
      $('#experiment-action-table-list').show()
      $('#experiment-action-block-list').hide()
    $('#use-experiment-action-block-list').click ->
      $('#experiment-action-table-list').hide()
      $('#experiment-action-block-list').show()
  else if /\/experiments\/(new|\d+\/edit)/.test(location)
    atmModelIdInput = $('div#input-atm-model-id')
    ocnModelIdInput = $('div#input-ocn-model-id')
    coupledModelIdInput = $('div#input-coupled-model-id')
    atmModelIdInput.detach()
    ocnModelIdInput.detach()
    coupledModelIdInput.detach()
    switch $('select#input-experiment-type').val()
      when 'amip' then $('div#input-experiment-type').after(atmModelIdInput.show())
      when 'omip' then $('div#input-experiment-type').after(ocnModelIdInput.show())
      when 'cmip' then $('div#input-experiment-type').after(coupledModelIdInput.show())
    $('select#input-experiment-type').change ->
      atmModelIdInput.detach()
      ocnModelIdInput.detach()
      coupledModelIdInput.detach()
      switch $('select#input-experiment-type').val()
        when 'amip' then $('div#input-experiment-type').after(atmModelIdInput.show())
        when 'omip' then $('div#input-experiment-type').after(ocnModelIdInput.show())
        when 'cmip' then $('div#input-experiment-type').after(coupledModelIdInput.show())

    $('form').on 'click', '.remove_field', (event) ->
      fieldset = $(this).closest('fieldset')
      fieldset.remove()
      event.preventDefault()

    $('form').on 'click', '.add_field', (event) ->
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')
      $(this).closest('div.right').before($(this).data('fields').replace(regexp, time))
      event.preventDefault()
      $('.select-action-type').change ->
        action_id = $(this).attr('id').split('_')[4]
        action_object = $("#experiment_experiment_actions_attributes_#{action_id}_action_object")
        return if not action_object.val()
        showActionContentFields action_id, action_object.val(), $(this).val()
      $('.select-action-object').change ->
        action_id = $(this).attr('id').split('_')[4]
        action_type = $("#experiment_experiment_actions_attributes_#{action_id}_action_type")
        return if not action_type.val()
        showActionContentFields action_id, $(this).val(), action_type.val()

    $('form').on 'click', '.move_up_field', (event) ->
      event.preventDefault()
      field = $(this).closest('fieldset.experiment-action-field')
      alert field.prev().is('fieldset.experiment-action-field')
      return if not field.prev().is('fieldset.experiment-action-field')
      field.insertBefore(field.prev())

    $('form').on 'click', '.move_down_field', (event) ->
      event.preventDefault()
      field = $(this).closest('fieldset.experiment-action-field')
      return if not field.next().is('fieldset.experiment-action-field')
      field.insertAfter(field.next())
