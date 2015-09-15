# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

$(document).on 'page:change', ->
  # 切换“指标信息”和“指标资源”.
  $('a#info').click ->
    $('div#info').show()
    $('div#resources').hide()
    $('#add-resource').hide()
  $('a#resources').click ->
    $('div#info').hide()
    $('div#resources').show()
    $('#add-resource').show()
