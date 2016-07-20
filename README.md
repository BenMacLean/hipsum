# Lipsum

Use this package if you want to add dummy Lorem Ipsum text to your page.

You can add a sentence, paragraph, or series of paragraphs to the page.  For
HTML pages you can wrap the paragraphs in HTML `<p>` tags.

For anyone familiar with the existing
[Lorem Ipsum package](https://github.com/nickclaw/atom-lorem-ipsum) you will
notice a lot of similarities.  Unfortunately that one doesn't work with
Atom >= 1.0, and that's why this now exists.  I had already completed a lot of
the work before I realised that existed which is why it's not a straight fork
of that package.

## Install

You can install it from the package manager.  Just search for "lipsum".

Or you can install it using APM.

```
apm install lipsum
```

## How to use

To use this, load the command panel, type "Lipsum" and choose the relevant
option.  Alternatively you can right click and choose "Lipsum", or choose
"Lipsum" from the Packages menu.

## Config options

There are a number of configuration options:

### Sentences/Paragraphs

#### Number of paragraphs
The number of paragraphs to generate when running the 'paragraphs' command".

The default value is 4.

#### Maximum words per sentence
When generating content, any sentence created will have no more than this
number of words.  

The default is 18.

#### Minimum words per sentence
When generating content, any sentence created will have at least this number of
words.  

The default is 8.

#### Maximum sentences per paragraph
When generating content, any paragraph created will have no more than this
number of sentences.  

The default is 8.

#### Minimum sentences per paragraph
When generating content, any paragraph created will have at least than this
number of sentences.  

The default is 3.

### HTML Extensions
You can also specify a list of file extensions where any paragraphs generated
will be wrapped in HTML `<p> </p>` tags.  This option is a list of file
extensions for HTML file types.

The default values are:
- .html
- .htm (does anyone still use this?)
- .php (I'm not sure whether this should be included here or not, but you can
override it if you want to)
- .twig (Twig templates)
- .tpl (Smarty templates)

When adding others, these should be added in lowercase, and remember to include
the opening '.'
