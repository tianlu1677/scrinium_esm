$(document).on 'page:change', ->
  # 切换“计划信息”和“计划资源”.
  $('a#info').click ->
    $('div#info').show()
    $('div#resources').hide()
    $('#add-resource').hide()
  $('a#resources').click ->
    $('div#info').hide()
    $('div#resources').show()
    $('#add-resource').show()
