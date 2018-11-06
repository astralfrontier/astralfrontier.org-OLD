/**
 * {% thumbnail <image-url> [<classes>] %}
 * 
 * Classes defaults to "ui large image"
 * 
 * Return a link to i/<image-url>, surrounding an image pointing at t/<image-url>.
 */
hexo.extend.tag.register('thumbnail', function(args) {
    const imageUrl = args.shift();
    const imageClasses = args.shift() || 'ui large image';
    return `<p><a href="i/${imageUrl}" class="${imageClasses.replace(/\./g, ' ')}"><img src="t/${imageUrl}" /></a></p>`;
});