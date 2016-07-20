Lipsum = require '../lib/lipsum'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "Lipsum", ->
    [workspaceElement, activationPromise] = []

    beforeEach ->
        workspaceElement = atom.views.getView(atom.workspace)
        activationPromise = atom.packages.activatePackage('lipsum')

        waitsForPromise ->
            atom.workspace.open('blankfile.txt').then (editor) ->
                expect(editor.getText()).toEqual ""

    describe "when the lipsum:sentence event is triggered", ->
        it "adds a single sentence", ->
            atom.commands.dispatch workspaceElement, 'lipsum:paragraph'

            waitsForPromise ->
                activationPromise

            runs ->
                editor = atom.workspace.getActiveTextEditor()
                text = editor.getText()
                expect(text).not.toEqual ""
                expect(text.split(' ').length).toBeGreaterThan 1

    describe "when the lipsum:paragraph event is triggered", ->
        it "adds a single paragraph", ->

            atom.commands.dispatch workspaceElement, 'lipsum:paragraph'

            waitsForPromise ->
                activationPromise

            runs ->
                editor = atom.workspace.getActiveTextEditor()
                text = editor.getText()
                expect(text).not.toEqual ""
                expect(text.indexOf("\n")).toEqual -1
                expect(text.split('.').length).toBeGreaterThan 1

    describe "when the lipsum:paragraphs event is triggered", ->
        it "adds multiple paragraph", ->

            atom.commands.dispatch workspaceElement, 'lipsum:paragraphs'

            waitsForPromise ->
                activationPromise

            runs ->
                editor = atom.workspace.getActiveTextEditor()
                text = editor.getText()
                expect(text).not.toEqual ""
                expect(text.indexOf("\n")).toBeGreaterThan 0
                expect(text.split('.').length).toBeGreaterThan 1
