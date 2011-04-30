window.addBlock = (name) -> alert(name)
# add a reference to a JS function in an array of "blocks" to be executed
# the exec reads the first function, passes it an obj with args, evals it
# then passes the return value as an obj with args to the next function, evals
# it, etc.

window.addWidget = (type) ->
  switch type
    when 'button'
      name = prompt('Button name', 'Button')
      button = $('#proto-button').clone().removeClass('proto').attr('id', name)
      $(button).find('span > span').text(name)
      $(button).appendTo('#canvas')

    when 'textinput'
      label = prompt('Text input label', 'Text input:')
      textinput = $('#proto-textinput').clone().removeClass('proto').attr('id', 'bla')
      $(textinput).find('label').text(label)
      $(textinput).appendTo('#canvas')

    when 'password'
      label = prompt('Password input label', 'Password input:')
      pass = $('#proto-password').clone().removeClass('proto')
      $(pass).find('label').text(label)
      $(pass).appendTo('#canvas')

    when 'textarea'
      label = prompt('Textarea label', 'Textarea:')
      area = $('#proto-textarea').clone().removeClass('proto')
      $(area).find('label').text(label)
      $(area).appendTo('#canvas')

window.removeWidget = ->
  last_child = $('#canvas > *:last')
  console.log(last_child)
  unless $(last_child).hasClass('proto')
    $(last_child).remove()

window.onBodyLoad = ->

$(document).ready ->
  $('#block1').touchstart ->
    alert 'touched'
