module.exports = {
  entry: [
    'themes/astralfrontier/source/js/index.js',
  ],
  module: {
    loaders: [
      {
        test: /\.js/,
        loader: 'babel-loader',
        exclude: /node_modules/,
        query: {
          presets: ['env']
        }
      }
    ]
  }
};
