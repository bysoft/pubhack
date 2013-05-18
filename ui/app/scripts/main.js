require.config({
    paths: {
        jquery: '../components/jquery/jquery',
        bootstrap: 'vendor/bootstrap',
        hello: './hello',
        pub: './pub'
    },
    shim: {
        bootstrap: {
            deps: ['jquery'],
            exports: 'jquery'
        }
    }
});

require(['app', 'jquery', 'bootstrap', 'hello', 'pub'], function (app, $, hello, pub) {
    'use strict';
    // use app here
    console.log(app);
    console.log(hello);
    console.log('Running jQuery %s', $().jquery);
});
