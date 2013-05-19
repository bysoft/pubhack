require.config({
    paths: {
        jquery: '../components/jquery/jquery',
        bootstrap: 'vendor/bootstrap',
        pub: './pub'
    },
    shim: {
        bootstrap: {
            deps: ['jquery'],
            exports: 'jquery'
        }
    }
});

require(['app', 'jquery', 'bootstrap', 'pub'], function (app, $, pub) {
    'use strict';
    // use app here
    console.log('Running jQuery %s', $().jquery);
});
