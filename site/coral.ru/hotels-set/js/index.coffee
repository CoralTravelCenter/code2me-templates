initially_visible = 6
always_visible_max = 9

predicateWithSelection = ($filters) ->
    filter_attrs = ['data-group', 'data-year-month']
    predicate = {}
    $filters.find('.selected').map (idx, el) ->
        $el = $(el)
        predicate[attr_name] = $el.attr(attr_name) for attr_name in filter_attrs when $el.attr(attr_name) and $el.attr(attr_name) != '*'
    predicate

applyPredicate = ($grid, $cards, $paging_ctl, predicate) ->
    $matched = $cards.filter (idx, el) ->
        $card = $(el)
        _.every Object.keys(predicate), (key) -> $card.attr(key) == predicate[key]
    matched_total = $matched.length
    if $matched.length > always_visible_max
        unless $grid.hasClass 'open'
            $matched = $matched.slice 0, initially_visible
            $paging_ctl.show()
    else
        $paging_ctl.hide()
    $cards.removeClass('shown')
    $matched.addClass('shown')
    $paging_ctl.find('.cards-count').text matched_total
    $grid.toggleClass 'no-match', $matched.length == 0

document.addEventListener 'DOMContentLoaded', ->
    $.fn.isotope = ->

    component_instance = '31dcdd88-d242-4ee6-8d76-532166496b06'
    component_instance_selector = "[data-component-instance='#{ component_instance }']"
    $ctx = $(component_instance_selector)
    $grid = $ctx.find('.cards-grid')
    $cards = $grid.find('.card-cell')
    $filters = $ctx.find('.filters-wrap')
    $pager = $ctx.find('.cards-grid + .actions')

    $(document).on 'click', "#{ component_instance_selector } .filters-wrap button", ->
        $(this).addClass('selected').siblings('.selected').removeClass('selected')
        applyPredicate $grid, $cards, $pager, predicateWithSelection $filters

    $(document).on 'click', "#{ component_instance_selector } [data-action='show-all']", ->
        $grid.addClass 'open'
        applyPredicate $grid, $cards, $pager, predicateWithSelection $filters

    applyPredicate $grid, $cards, $pager, predicateWithSelection $filters
, once: yes