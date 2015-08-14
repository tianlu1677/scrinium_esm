# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require_tree .

selectByGET = (id, api_url) ->
  $('#'+id).select2(
    ajax:
      url: ROOT_PATH+api_url
      dataType: 'json'
      delay: 250
      processResults: (data) ->
        {
          results: $.map( data, (d, i) ->
            { id: d[0], text: d[1] }
          )
        }
      results: (data, page) ->
        results: data
  )

$(document).on 'page:change', ->
  # Using Select2 to enhance select element.
  selectByGET 'input-user-name', 'api/v1/users/names'
