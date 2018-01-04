auth_token = $('meta[name=csrf-token]').attr('content');
$.ajaxSetup({
  headers: { 'X-CSRF-Token': auth_token }
})

validNavigation = false

window.onbeforeunload = ->
  endSession() unless validNavigation

endSession = ->
  $.ajax '/users/sign_out',
         method: 'delete'
         success: ->
          window.top.close()

$('document').bind 'keypress', (e)->
  validNavigation = true if (e.keyCode == 116)

$("a").bind "click", ()->
  validNavigation = true

$("form").bind "submit", ()->
  validNavigation = true

$("input[type=submit]").bind "click", ()->
  validNavigation = true
