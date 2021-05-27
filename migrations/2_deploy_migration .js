const MarketPlaceSettings = artifacts.require("MarketPlaceSettings");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
