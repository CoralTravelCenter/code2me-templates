import { ASAP } from '/site/common/js/utils.coffee'

ASAP ->
    component_instance = 'b197d8a8-e842-4ea3-83a4-f48fc017944a'
    $ctx = $("[data-component-instance='#{ component_instance }']")
    $grid = $ctx.find('.cards-grid')
    $cards = $grid.find('.card-cell')
    $filters = $ctx.find('.filters-wrap')