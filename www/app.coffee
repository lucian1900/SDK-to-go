# add a reference to a JS function in an array of "blocks" to be executed
# the exec reads the first function, passes it an obj with args, evals it
# then passes the return value as an obj with args to the next function, evals
# it, etc.

fetchWidgets = -> $('#view-canvas').children().not('.proto')

window.updateRun = -> true

window.addBlock = (name) ->
  switch name
    when 'alert'
      message = prompt("Message", "Hello world!")
      closure = -> alert message

    when false
      closure = -> eval $('#editor').find('textarea').val()

  objName = $("input[name='object-choice']:radio").filter(':checked').val()
  obj = $("##{objName}-object").html()

  if objName == 'window'
    $('#run').live 'pageshow', closure

  true

window.addWidget = (type) ->
  widget = $("#proto-#{type}").clone().removeClass('proto')

  switch type
    when 'button'
      label = prompt('Button name', 'Button')
      widget.find('span > span').text(label)

    when 'textinput'
      label = prompt('Text input label', 'Text')
      widget.find('label').text(label)

    when 'password'
      label = prompt('Password input label', 'Password')
      widget.appendTo('#view-canvas')

    when 'textarea'
      label = prompt('Textarea label', 'Textarea')
      widget.find('label').text(label)

  widget.attr('id', label).appendTo('#view-canvas')


  object = $('#proto-object').clone(true, true).removeClass('proto').attr('id', label+'-object')
  #console.log object

  object.find('label').attr('for', label)
  object.find('label > span > span:first').text(label)
  object.find('input').attr('value', label).attr('id', label)

  object.appendTo('#control-canvas')

  #refresh forms
  #$("input[type='checkbox']".attr('checked', true).checkboxradio('refresh')
  #$("input[type='radio']").attr("checked",true).checkboxradio("refresh")
  #$("select").each (i) -> i.selectmenu("refresh")

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
