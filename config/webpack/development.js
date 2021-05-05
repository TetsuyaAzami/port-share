process.env.NODE_ENV = process.env.NODE_ENV || "development";
const environment = require("./environment");
const { CleanWebpackPlugin } = require("clean-webpack-plugin");

const webpackConfig = {
  plugins: [
    new CleanWebpackPlugin(),
  ],
};

module.exports = webpackConfig;
module.exports = environment.toWebpackConfig();
