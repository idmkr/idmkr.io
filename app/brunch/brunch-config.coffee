namespace = require("./package.json").name
style = (n) -> namespace + "/styles/" + n

publicPath = '../../htdocs'

exports.config =
    paths:
        public: publicPath
        watched: [namespace, "vendor"]

    conventions:
        ignored: [
            /vendor[\\/]node[\\/]/,
            /vendor[\\/](j?ruby-.*|bundle)[\\/]/
        ]


    files:
        stylesheets:
            joinTo:
                'css/app.css' : /^(?!idmkr\/styles\/mobile)/
                'css/mobile.css' : /^idmkr\/styles\/mobile/
            order:
                before: [style 'global.scss']
                after: [
                    style namespace + '.scss'
                    style 'pages/*.scss'
                ]

        javascripts:
            joinTo:
                'js/libraries.js': new RegExp('^(?!' + namespace + '\/)')
                'js/app.js': new RegExp('^' + namespace + '\/')
            order:
                before : [
                    'vendor/scrolloverflow.min.js'
                    'vendor/modernizr.min.js'
                ]
    modules:
        nameCleaner: (path) => path.replace(/scripts\//, "")

    plugins:
        postcss:
            processors: [
                require('autoprefixer')(['last 8 versions']),
                require('csswring')
            ]

        jadePages:
            filters:
                php: (text) -> '<?php \n' + text + '\n?>'
            destination: (path) ->
                path.replace new RegExp(namespace + '\/(templates\/.*)\.jade$'), '$1.php'
            jade:
                pretty: true
                basedir: __dirname + '/' + namespace + '/templates' 