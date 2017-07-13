var localContentLoaded = false

function loadLocalContent() {
    if (localContentLoaded) {
        return;
    }
    localContentLoaded = true
    $.ajax({
        url: '/search.xml',
        dataType: 'xml',
        success: function (data) {
            var localContent = []
            $(data).find('entry').each(function() {
                var url = $('url', this).text()
                var title = $('title', this).text()
                var content = $('content', this).text()
                localContent.push({url: url, title: title, content: content})
            })

            $('#site-search').search({
                source: localContent,
                searchFields: ['title', 'content'],
                searchFullText: true
            })
        }
    })
}

$(document)
    .ready(function () {
        // fix main menu to page on passing
        $('.main.menu').visibility({type: 'fixed'});
        $('.overlay').visibility({type: 'fixed', offset: 80});

        // lazy load images
        $('#article-body img').visibility({type: 'image', transition: 'vertical flip in', duration: 500});

        // show dropdown on hover
        $('.main.menu  .ui.dropdown').dropdown({on: 'hover'});

        // Initialize site search
        $('#site-search input').focus(loadLocalContent)
    });

window.showSidebar = function() {
    $('#site-sidebar').sidebar('toggle')
}
