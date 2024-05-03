const path = require('path');

module.exports = {
  mode: 'development', // or 'production'
  entry: './app/javascript/controllers/application.js', // adjust this path to your entry file
  output: {
    path: path.resolve(__dirname, 'public/packs'),
    filename: 'js/[name]-[fullhash].js',
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env']
          }
        }
      },
      // Add other loaders here for handling different file types (CSS, images, etc.)
    ]
  },
  plugins: [
    // Add any plugins here
  ]
};
