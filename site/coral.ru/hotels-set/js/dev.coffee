import { ASAP, preload } from '/site/common/js/utils.coffee'

import test_data from '/site/coral.ru/hotels-set/test-data.json'


ASAP ->
    preload 'https://cdnjs.cloudflare.com/ajax/libs/mustache.js/3.2.1/mustache.min.js', ->
        $container = $('.code2me-hotels-set')
        template_html = $container.get(0).outerHTML
        $container.replaceWith Mustache.render template_html, test_data
