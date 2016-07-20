LipsumView = require './lipsum-view'
loremIpsum = require 'lorem-ipsum'
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
            description: "List any extensions that should be wrapped in HTML code when generating Lipsum."
            default: [".html", ".htm", ".php", ".twig", ".tpl"]
            items:
                type: 'string'

    outputText: (items) ->
        extensions = atom.config.get 'lipsum.htmlExtensions'

        items.sentenceLowerBound = atom.config.get 'lipsum.minPerSentence'
        items.sentenceUpperBound = atom.config.get 'lipsum.maxPerSentence'
        items.paragraphLowerBound = atom.config.get 'lipsum.minPerParagraph'
        items.paragraphUpperBound = atom.config.get 'lipsum.maxPerParagraph'

        if editor = atom.workspace.getActiveTextEditor()
            ext = path.extname(editor.getPath()).toLowerCase()
            if ext and ext in extensions
                items.format = 'html'
            output = loremIpsum(items)
            editor.insertText(output)
        else
            alert('You can only insert text into an active text editor.')

    activate: ->
        atom.commands.add 'atom-workspace',
            'lipsum:paragraph': => @paragraph()
            'lipsum:paragraphs': => @paragraphs()
            'lipsum:sentence': => @sentence()

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
