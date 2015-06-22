metalsmith      = require 'metalsmith'
assets          = require 'metalsmith-assets'
beautify        = require 'metalsmith-beautify'
cheerio         = require 'cheerio'
collections     = require 'metalsmith-collections'
dateInFilename  = require 'metalsmith-date-in-filename'
drafts          = require 'metalsmith-drafts'
feed            = require 'metalsmith-feed'
jade            = require 'metalsmith-jade'
less            = require 'metalsmith-less'
link_checker    = require 'metalsmith-broken-link-checker'
markdown        = require 'metalsmith-markdown'
metadata        = require 'metalsmith-metadata'
pagination      = require 'metalsmith-pagination'
path            = require 'metalsmith-path'
serve           = require 'metalsmith-serve'
templates       = require 'metalsmith-templates'

cheerio_plugin = (options) ->
  match = new RegExp("\.html")
  plugin = (files, metalsmith, done) ->
    for file of files
      if match.test(file)
        $ = cheerio.load files[file].contents, { normalizeWhitespace: true }

        # All external links should open in new windows
        $('a[href^="http://"]').attr("target", "_blank")
        $('a[href^="https://"]').attr("target", "_blank")

        files[file].contents = $.html()
    done()
  plugin

collection_data = {
  blog:
    sortBy: 'date'
    reverse: true
  masque:
    sortBy: 'title'
  reviews:
    sortBy: 'date'
    reverse: true
  songofeden:
    sortBy: 'title'
  vessels:
    sortBy: 'title'
}

pagination_data = {
  'collections.blog':
    perPage: 5
    template: 'blog.jade'
    first: 'blog.html'
    path: 'blog-:num.html'
  'collections.reviews':
    perPage: 12
    template: 'collection.jade'
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
  .use(less({}))
  .use(jade({
    useMetadata: true
  }))
  .use(markdown({
    smartypants: true
    gfm: true
    tables: true
  }))
  .use(assets({
    source: './assets'
    destination: './assets'
  }))
  .use(path())
  .use(templates({
    engine: 'jade'
    directory: 'templates'
  }))
  .use(feed(collection: 'blog'))
  .use(cheerio_plugin())
  .use(beautify({
    html: { wrap_line_length: 80 }
  }))
  .use(link_checker({warn: true}))
  .destination('./build')
# .use(serve({
#   host: '0.0.0.0'
#   port: 3000
# }))
  .build (err, files) ->
    if err
      console.error err
