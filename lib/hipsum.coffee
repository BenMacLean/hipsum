hipsumView = require './hipsum-view'
hipsterIpsum = require 'hipster-ipsum'
path = require 'path'
{CompositeDisposable} = require 'atom'

module.exports =
    subscriptions: null
    config:
        paragraphs:
            type: 'integer'
            title: 'Number of paragraphs'
            description: "Number of paragraphs to generate when running the 'paragraphs' command"
            default: 4
        maxPerSentence:
            type: 'integer'
            title: 'Maximum words per sentence'
            default: 18
        minPerSentence:
            type: 'integer'
            title: 'Minimum words per sentence'
            default: 8
        maxPerParagraph:
            type: 'integer'
            title: 'Maximum sentences per paragraph'
            default: 8
        minPerParagraph:
            type: 'integer'
            title: 'Minimum sentences per sentence'
            default: 3
        htmlExtensions:
            type: 'array'
            title: 'HTML Extensions'
            description: "List any extensions that should be wrapped in HTML code when generating hipsum."
            default: [".html", ".htm", ".php", ".twig", ".tpl"]
            items:
                type: 'string'

    outputText: (items) ->
        extensions = atom.config.get 'hipsum.htmlExtensions'

        items.sentenceLowerBound = atom.config.get 'hipsum.minPerSentence'
        items.sentenceUpperBound = atom.config.get 'hipsum.maxPerSentence'
        items.paragraphLowerBound = atom.config.get 'hipsum.minPerParagraph'
        items.paragraphUpperBound = atom.config.get 'hipsum.maxPerParagraph'

        if editor = atom.workspace.getActiveTextEditor()
            ext = path.extname(editor.getPath()).toLowerCase()
            if ext and ext in extensions
                items.format = 'html'
            output = hipsterIpsum(items)
            editor.insertText(output)
        else
            alert('You can only insert text into an active text editor.')

    activate: ->
        atom.commands.add 'atom-workspace',
            'hipsum:paragraph': => @paragraph()
            'hipsum:paragraphs': => @paragraphs()
            'hipsum:sentence': => @sentence()

    deactivate: ->
        @subscriptions.dispose()

    paragraph: ->
        items = {units: 'paragraphs', count: 1}
        @outputText(items)

    paragraphs: ->
        items = {units: 'paragraphs', count: 4}
        @outputText(items)

    sentence: ->
        items = {units: 'sentences', count: 1}
        @outputText(items)
