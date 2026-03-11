sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'epm.ui.epmui',
            componentId: 'POEntitySetObjectPage',
            contextPath: '/POEntitySet'
        },
        CustomPageDefinitions
    );
});