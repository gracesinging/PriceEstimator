Config = 
  NAME: "CLC Pricing Estimator"
  PRICING_ROOT_PATH: "/prices/"
  DATACENTERS_URL: "/prices/data-center-prices.json"
  CURRENCY_URL: "./json/exchange-rates.json"
  DEFAULT_CURRENCY:
    id: "USD"
    rate: 1.0
    symbol: "$"

  init: (app, cb) ->
    $.getJSON('./json/data-config.json', (data) =>
      config = data
      @NAME = config.name
      @PRICING_ROOT_PATH = config.pricingRootPath
      @DATACENTERS_URL = config.datacentersUrl
      @CURRENCY_URL = config.currencyUrl
      @SUPPORT_PRICING_URL = config.supportPricingUrl
      @DEFAULT_CURRENCY = config.defaultCurrency
      $.getJSON @DATACENTERS_URL, (datacentersData) =>
        app.datacentersData = datacentersData
        $.getJSON @CURRENCY_URL, (currencyData) =>
          app.currencyData = currencyData
          cb.resolve()
    )
    return cb.promise
  

module.exports = Config