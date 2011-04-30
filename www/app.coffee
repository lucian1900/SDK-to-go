window.addBlock = (name) -> alert(name)
# add a reference to a JS function in an array of "blocks" to be executed
# the exec reads the first function, passes it an obj with args, evals it
# then passes the return value as an obj with args to the next function, evals
# it, etc.

window.addWidget = (name) ->
  #button = $('<div data-'+ $.mobile.ns +'-role="button">Button</div>')
  #button.appendTo('#canvas')

  #button = $('#block1').clone()
  #button.appentTo('#canvas')

  button = $('#protobutton').clone().removeClass('proto').attr('id', "bla")
  $(button).find('span > span').text('Button!')
  $(button).appendTo('#canvas')

$(document).ready ->
  $('#block1').touchstart ->
    alert 'touched'
