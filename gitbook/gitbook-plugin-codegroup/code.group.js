require([
    'jquery',
    'gitbook',
], function ($, gitbook) {
    var self = self || {};
    var active = 'gbcg-active';
    var storageKey = 'codegroup';

    var getCodeGroupStore = function () {
        var codeGroupStore = gitbook.storage.get(storageKey);
        return codeGroupStore || {defaultLang: null};
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

    var selectLang = function(codeLang) {
        var i, elements = $("[data-code-lang='" + codeLang + "']");
        for (i = 0; i < elements.length; ++i) {
            selectTab(elements[i]);
        }
    };

    self.showtab = function showtab(event) {
        var codeLang = $(this).attr('data-code-lang');
        event.preventDefault();
        event.stopPropagation();
        selectLang(codeLang);
        var codeGroupStore = getCodeGroupStore();
        codeGroupStore.defaultLang = codeLang;
        gitbook.storage.set(storageKey, codeGroupStore);
    };

    var setup = function () {
        var $selectors = $('.gbcg-selector');
        $selectors.unbind('click', self.showtab);
        $selectors.click(self.showtab);

        $('.gbcg-codegroup').each(function () {
            var lang = getCodeGroupStore().defaultLang;
            if (lang) {
                selectLang(lang);
            }
        });
    };

    gitbook.events.bind('page.change', setup);
    setup();
    return self;
});
