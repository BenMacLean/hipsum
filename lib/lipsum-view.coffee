module.exports =
class LipsumView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('lipsum')

    # Create message element
    message = document.createElement('div')
    message.textContent = "Add some Lipsum crap to the page."
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
