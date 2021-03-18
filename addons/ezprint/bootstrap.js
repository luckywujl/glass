require.config({
    paths: {
        'printing': '../addons/ezprint/js/printting',
        'print-editor': '../addons/ezprint/js/summernote.min'
    },
    shim: {
        'print-editor': ['css!../addons/ezprint/js/summernote.min.css'],
    }
});