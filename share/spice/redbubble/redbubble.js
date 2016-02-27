(function (env) {
    "use strict";

    var item_brand = function(item) {
      return item.alt_text.split("by ").pop();
    };

    var item_image_url = function(item) {
      return item.images.thumbnail_url;
    };

    var item_price = function(item) {
      return item.price.retail_inc_tax.currency + " " + item.price.retail_inc_tax.unit + item.price.retail_inc_tax.amount;
    };

    var item_title = function(item) {
       return item.display_title + " (" + item.description + ")";
    };

    env.ddg_spice_redbubble = function(api_result) {

        // Validate the response
        if (!api_result || !api_result.has_results) {
            return Spice.failed('redbubble');
        }

        // Render the response
        Spice.add({
            id: "redbubble",

            // Customize these properties
            name: "Products",
            data: api_result["products"],
            meta: {
                sourceName: "Redbubble",
                sourceUrl: 'https://www.redbubble.com/shop/' + api_result.name
            },
            normalize: function(item) {
                var normalized_item = {
                    heading: item_title(item),
                    img: item_image_url(item),
                    price: item_price(item),
                    brand: item_brand(item),
                };
                return normalized_item;
            },
            templates: {
                group: 'products',
                options: {
                    moreAt: true,
                    rating: false
                }
            }
        });
    };
}(this));
