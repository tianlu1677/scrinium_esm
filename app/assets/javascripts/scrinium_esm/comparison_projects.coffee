$(document).on 'page:change', ->
  # 切换“信息”、“资源”和“试验规范”.
  $('a#info').click ->
    $('div#info').show()
    $('div#resources').hide()
    $('#add-resource').hide()
    $('div#experiment-specs').hide()
    $('#add-experiment-spec').hide()
  $('a#resources').click ->
    $('div#info').hide()
    $('div#resources').show()
    $('#add-resource').show()
    $('div#experiment-specs').hide()
    $('#add-experiment-spec').hide()
  $('a#experiment-specs').click ->
    $('div#info').hide()
    $('div#resources').hide()
    $('#add-resource').hide()
    $('div#experiment-specs').show()
    $('#add-experiment-spec').show()
