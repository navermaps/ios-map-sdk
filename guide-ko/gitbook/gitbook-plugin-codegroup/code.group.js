require([
    'jquery',
    'gitbook',
], function ($, gitbook) {
    var self = self || {};
    var active = 'gbcg-active';
    var storageKey = 'codegroup';

    var getCodeGroupStore = function () {
        var codeGroupStore = gitbook.storage.get(storageKey);
        return codeGroupStore || {};
    };

    var selectTab = function(element) {
        var $selector = $(element);
        var $codeGroup = $selector.closest('.gbcg-codegroup');
        var $container = $codeGroup.find('#gbcg-tab-container');
        $codeGroup.find('.gbcg-selector').removeClass(active);
        var tabId = $selector.attr('data-tab');
        var selectorId = $selector.attr('id');
        var $tab = $('#' + tabId);
        $container.html($tab.html());
        $selector.addClass(active);
    };

    var selectAll = function(tabCategory, tabName) {
        var i, elements = $("[data-tab-category='" + tabCategory + "']").filter("a:contains('" + tabName + "')");
        for (i = 0; i < elements.length; ++i) {
            selectTab(elements[i]);
        }
    };

    self.showtab = function(event) {
        var tabCategory = $(this).attr('data-tab-category');
        var tabName = $(this).text();
        var codeGroupStore = getCodeGroupStore();
        event.preventDefault();
        event.stopPropagation();
        selectAll(tabCategory, tabName);
        codeGroupStore[tabCategory] = tabName;
        gitbook.storage.set(storageKey, codeGroupStore);
    };

    var setup = function () {
        var codeGroupStore = getCodeGroupStore();
        var $selectors = $('.gbcg-selector');
        $selectors.unbind('click', self.showtab);
        $selectors.click(self.showtab);
        for (var category in codeGroupStore) {
            selectAll(category, codeGroupStore[category]);
        }
    };

    gitbook.events.bind('page.change', setup);
    setup();
    return self;
});
