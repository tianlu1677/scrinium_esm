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

  $('#select-action-type').change ->
    switch $(this).val()
      when '0'
        $('#edit-action-subject').html """
          <input class='subject-input-1' placeholder='#{I18n.t('experiment.action_subjects.parameter_name')}'>
          <input class='subject-input-2' placeholder='#{I18n.t('experiment.action_subjects.parameter_new_value')}'>
        """
      when '1'
        $('#edit-action-subject').html """
          <input class='subject-input-1' placeholder='#{I18n.t('experiment.action_subjects.what_scheme')}'>
          <input class='subject-input-2' placeholder='#{I18n.t('experiment.action_subjects.scheme_name')}'>
        """
      when '2'
        $('#edit-action-subject').html """
          <input class='subject-input-1' placeholder='#{I18n.t('experiment.action_subjects.what_scheme')}'><br/>
          <textarea class='subject-textarea-2' placeholder='#{I18n.t('experiment.action_subjects.changed_parts')}'>
        """
      when '3'
        $('#edit-action-subject').html """
          <input class='subject-input-1' placeholder='#{I18n.t('experiment.action_subjects.code_file')}'><br/>
          <textarea class='subject-textarea-2' placeholder='#{I18n.t('experiment.action_subjects.changed_parts')}'>
        """
      when '4'
        $('#edit-action-subject').html """
          <input class='subject-input-1' placeholder='#{I18n.t('experiment.action_subjects.added_compiler_option')}'>
        """
      when '5'
        $('#edit-action-subject').html """
          <input class='subject-input-1' placeholder='#{I18n.t('experiment.action_subjects.deleted_compiler_option')}'>
        """
      when '6'
        $('#edit-action-subject').html """
          <input class='subject-input-1' placeholder='#{I18n.t('experiment.action_subjects.changed_compiler_option')}'>
          <input class='subject-input-2' placeholder='#{I18n.t('experiment.action_subjects.compiler_option_new_value')}'>
        """
      when '7'
        $('#edit-action-subject').html """
          <input class='subject-input-1' placeholder='#{I18n.t('experiment.action_subjects.new_space_resolution')}'>
        """
      when '8'
        $('#edit-action-subject').html """
          <input class='subject-input-1' placeholder='#{I18n.t('experiment.action_subjects.new_time_step_size')}'>
        """

  $('#save-action').click ->
    return if ! $('.subject-input-1').val()
    content = switch $('#select-action-type').val()
      when '0', '1', '6'
        "<td>#{$('.subject-input-1').val()}</td><td>#{$('.subject-input-2').val()}</td>"
      when '2', '3'
        "<td>#{$('.subject-input-1').val()}</td><td>#{$('.subject-textarea-2').val()}</td>"
      when '4', '5', '7', '8'
        "<td>#{$('.subject-input-1').val()}</td><td></td>"
    randomString = Math.random().toString(36).substring(7)
    $('#action-placeholder').before """
      <tr id='#{randomString}'>
        <td>#{ActionTypeMap[$('#select-action-type').val()]}</td>
        #{content}
        <td><a class='button btn-xs btn-danger float-right' id='delete-action-#{randomString}'>#{I18n.t('action.delete')}</a></td>
      </tr>
    """

  $('a[id|=delete-action]').click ->
    alert 'hhhh'
    randomString = $(this).attr('id').split('-')[2]
    $('tr#'+randomString).remove()

  $('input[type=submit]').click ->
    action_types = $('tbody').children().map(->
      value = $(this).children().html()
      Object.keys(ActionTypeMap).filter((k) ->
        ActionTypeMap[k] == value
      )[0]
    ).get().join(',')
    action_subjects = $('tbody').children().map(->
      $(this).children().slice(1, 3).map(->
        $(this).text()
      ).get().join('____')
    ).get().join(',')
    form = $('form')
    form.append """
      <input type='hidden' name='action_types' value='#{action_types}'>
      <input type='hidden' name='action_subjects' value='#{action_subjects}'>
    """
