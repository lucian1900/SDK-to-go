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
  canvas = $('#view-canvas')

  switch type
    when 'button'
      label = prompt 'Button name', 'Button'
      canvas.append """<button id="#{label}">#{label}</button>"""
      canvas.find("##{label}").button()

    when 'textinput'
      label = prompt 'Text input label', 'Text'
      canvas.append """<div id="#{label}">
                          <label for="name">#{label}</label>
                          <input type="text" name="name" value="" />
                       </div>"""
      canvas.find("##{label} > input").textinput()

    when 'password'
      label = prompt('Password input label', 'Password')
      canvas.append """<div id="#{label}">
                           <label for="password">#{label}</label>
                           <input type="password" name="password" value=""/>
                       </div>"""
      canvas.find("##{label} > input").textinput()

    when 'textarea'
      label = prompt('Textarea label', 'Textarea')
      canvas.append """<div id="#{label}">
                           <label for="textarea">#{label}</label>
                           <textarea name="textarea"></textarea>
                       </div>"""
      canvas.find("##{label} > textarea").textinput()


  canvas = $('#control-canvas')
  canvas.append """
        <div id="#{label}-object" class="object">
            <label for="object-choice">#{label}</label>
            <input type="radio" name="object-choice" value="object"/>

            <select name="event-choice">
                <option value="load">load</option>
                <option value="click">click</option>
                <option value="focus">focus</option>
            </select>
        </div>"""
  canvas.children("#{label}-object > input[type='radio']").checkboxradio()
  canvas.children("#{label}-object > select").selectmenu()

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
