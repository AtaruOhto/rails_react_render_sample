module.exports = {
    entry: {
        server_side: './app/assetSrc/server_side.js'
    },
    output: {
        path: __dirname + '/app/assets/javascripts',
        filename: '[name].js'
    },
    module: {
        loaders: [{
            test: /\.js?$/,
            exclude: /node_modules/,
            loader: 'babel',
            query: {
                presets: ['es2015','react']
            }
        }]
    }
};
