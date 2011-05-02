# add a reference to a JS function in an array of "blocks" to be executed
# the exec reads the first function, passes it an obj with args, evals it
# then passes the return value as an obj with args to the next function, evals
# it, etc.

fetchWidgets = -> $('#view-canvas').children().not('.proto')

window.addBlock = (name) ->
  console.log fetchWidgets()

window.updateObjects = () ->
  widgets = fetchWidgets().each (i) ->
    console.log i
    #i.appendTo('#object-select')

window.addWidget = (type) ->
  widget = $("#proto-#{type}").clone().removeClass('proto')

  switch type
    when 'button'
      label = prompt('Button name', 'Button')
      widget.find('span > span').text(label)

    when 'textinput'
      label = prompt('Text input label', 'Text input:')
      widget.find('label').text(label)

    when 'password'
      label = prompt('Password input label', 'Password input:')
      widget.appendTo('#view-canvas')

    when 'textarea'
      label = prompt('Textarea label', 'Textarea:')
      widget.find('label').text(label)

  widget.attr('id', label).appendTo('#view-canvas')


  block = $('#proto-object').clone().removeClass('proto').attr('id', label+'-object')

  block.children('label').attr('for', label).html(label)
  block.children('input').attr('value', label).attr('id', label)

  block.appendTo('#control-canvas')

window.removeWidget = ->
  'Pop the last widget from the inverted stack.'
  last_child = $('#view-canvas > *:last')

  unless $(last_child).hasClass('proto')
    $(last_child).remove()

window.onBodyLoad = ->
  #$('#object-select').bind 'click', 'focus' ->


$(document).ready ->
  $('#block1').touchstart ->
    alert 'touched'
