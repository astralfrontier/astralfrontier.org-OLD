metalsmith      = require 'metalsmith'
assets          = require 'metalsmith-assets'
beautify        = require 'metalsmith-beautify'
collections     = require 'metalsmith-collections'
dateInFilename  = require 'metalsmith-date-in-filename'
default_values  = require 'metalsmith-default-values'
drafts          = require 'metalsmith-drafts'
feed            = require 'metalsmith-feed'
ignore          = require 'metalsmith-ignore'
inPlace         = require 'metalsmith-in-place'
jquery          = require 'metalsmith-jquery'
layouts         = require 'metalsmith-layouts'
less            = require 'metalsmith-less'
link_checker    = require 'metalsmith-broken-link-checker'
markdownit      = require 'metalsmith-markdownit'
metadata        = require 'metalsmith-metadata'
more            = require 'metalsmith-more'
open_graph      = require 'metalsmith-open-graph'
pagination      = require 'metalsmith-pagination'
path            = require 'metalsmith-path'
serve           = require 'metalsmith-serve'
tags            = require 'metalsmith-tags'
typography      = require 'metalsmith-typography'
yaml            = require 'metalsmith-yaml'

collection_data = {
  blog:
    sortBy: 'date'
    reverse: true
  masque:
    sortBy: 'title'
  reviews:
    sortBy: 'title'
  songofeden:
    sortBy: 'title'
  vessels:
    sortBy: 'title'
}

pagination_data = {
  'collections.blog':
    perPage: 5
    layout: 'blog.jade'
    first: 'index.html'
    path: 'blog-:num.html'
  'collections.reviews':
    perPage: 12
    layout: 'reviewlist.jade'
    first: 'reviews.html'
    path: 'reviews-:num.html'
    pageMetadata:
      title: 'Reviews'
}

metalsmith(__dirname)
  .use(metadata({
    'nav': 'nav.yaml'
    'site': 'site.yaml'
    'social_media': 'social_media.yaml'
  }))
  .use(default_values([
      pattern: 'blog/*.md'
      defaults:
        layout: 'blogpost.jade'
        collection: 'blog'
    ,
      pattern: 'review/*.md'
      defaults:
        layout: 'review.jade'
        collection: 'reviews'
  ]))
  .use(drafts())
  .use(dateInFilename(true))
  .use(collections(collection_data))
  .use(pagination(pagination_data))
  .use(markdownit({
    html: true
  }))
  .use(yaml({}))
  .use(inPlace({
    engine: 'ejs'
    partials: 'partials'
    filename: 'temp.ejs'
  }))
  .use(path())
  .use(more({
    alwaysAddKey: true
  }))
  .use(tags({
    handle: 'tagged'
    sortBy: 'date'
    reverse: true
    layout: 'tag.jade'
    path: 'tag/:tag.html'
    pathPage: 'tag/:tag-:num.html'
    perPage: 12
  }))
  .use(typography({
    lang: 'en'
  }))
  .use(layouts({
    engine: 'jade'
    directory: 'layouts'
    partials: 'partials'
    default: 'fullpage-title.jade'
  }))
  .use(open_graph({
    pattern: '**/*.html'
    sitename: 'Astral Frontier'
    siteurl: 'http://astralfrontier.org/'
    image: '.og-image'
    description: 'synopsis'
  }))
  .use(jquery(($) ->
    # All external links should open in new windows
    $('a[href^="http://"]').attr("target", "_blank")
    $('a[href^="https://"]').attr("target", "_blank")
  ))
  .use(feed({
    collection: 'blog'
    postCustomElements: (file) ->
      if file.tagged?
        ['category': file.tagged]
  }))
  .use(beautify({
    indent_size: 4
    indent_char: ' '
    html: { wrap_line_length: 80 }
    js: { indent_size: 2 }
  }))
  .use(assets({
    source: './assets'
    destination: './assets'
  }))
  .use(assets({
    source: './bower_components'
    destination: './assets/bower'
  }))
  .use(less({
    pattern: 'assets/css/*.less'
    render:
      paths: [ './assets/css', './assets/css/cerulean', './assets/css/bootstrap-less' ]
  }))
  .use(ignore(['**/*.less']))
  .use(link_checker({warn: true}))
  .destination('./build')
# .use(serve({
#   host: '0.0.0.0'
#   port: 3000
# }))
  .build (err, files) ->
    if err
      console.error err.stack
      process.exit(1)
