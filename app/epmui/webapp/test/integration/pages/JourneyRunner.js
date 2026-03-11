sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"epm/ui/epmui/test/integration/pages/POEntitySetList",
	"epm/ui/epmui/test/integration/pages/POEntitySetObjectPage",
	"epm/ui/epmui/test/integration/pages/POitemssetObjectPage"
], function (JourneyRunner, POEntitySetList, POEntitySetObjectPage, POitemssetObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('epm/ui/epmui') + '/test/flp.html#app-preview',
        pages: {
			onThePOEntitySetList: POEntitySetList,
			onThePOEntitySetObjectPage: POEntitySetObjectPage,
			onThePOitemssetObjectPage: POitemssetObjectPage
        },
        async: true
    });

    return runner;
});

