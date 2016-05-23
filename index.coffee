metalsmith      = require 'metalsmith'
assets          = require 'metalsmith-assets'
beautify        = require 'metalsmith-beautify'
collections     = require 'metalsmith-collections'
dateInFilename  = require 'metalsmith-date-in-filename'
drafts          = require 'metalsmith-drafts'
feed            = require 'metalsmith-feed'
ignore          = require 'metalsmith-ignore'
inPlace         = require 'metalsmith-in-place'
jquery          = require 'metalsmith-jquery'
layouts         = require 'metalsmith-layouts'
less            = require 'metalsmith-less'
link_checker    = require 'metalsmith-broken-link-checker'
markdown        = require 'metalsmith-markdown'
metadata        = require 'metalsmith-metadata'
more            = require 'metalsmith-more'
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
  .use(drafts())
  .use(dateInFilename(true))
  .use(collections(collection_data))
  .use(pagination(pagination_data))
  .use(markdown({
    smartypants: true
    gfm: true
    tables: true
  }))
  .use(yaml({}))
  .use(inPlace({
    engine: 'toffee'
    partials: 'partials'
  }))
  .use(typography({
    lang: 'en'
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
  .use(layouts({
    engine: 'jade'
    directory: 'layouts'
    partials: 'partials'
    default: 'fullpage-title.jade'
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
    pattern: 'assets/css/astralfrontier.less'
    render: { paths: ['./assets/css'] }
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
