package DDG::Spice::Redbubble;

# ABSTRACT: Search for available products.

use DDG::Spice;

# Caching - http://docs.duckduckhack.com/backend-reference/api-reference.html#caching
spice is_cached => 0;
spice proxy_cache_valid => "200 304 1d";

spice wrap_jsonp_callback => 1; # only enable for non-JSONP APIs (i.e. no &callback= parameter)

# API endpoint - http://docs.duckduckhack.com/walkthroughs/forum-lookup.html#api-endpoint
spice to => 'https://www.redbubble.com/api/products/$1.json';

# Triggers - https://duck.co/duckduckhack/spice_triggers
# The exact Redbubble product names.
my @rb_products_singular = ('t-shirt', 'pencil skirt',
                            'iphone case', 'samsung galaxy case', 'ipad case', 'laptop skin', 'laptop sleeve',
                            'sticker',
                            'poster', 'canvas print', 'photographic print', 'art print', 'framed print', 'metal print',
                            'throw pillow', 'duvet cover', 'mug', 'travel mug',
                            'greeting card', 'postcard', 'calendar', 'spiral notebook', 'hardcover journal',
                            'tote bag', 'drawstring bag');
my @rb_products_irregular = ('leggings', 'scarf', 'scarves', 'kid clothes', 'studio pouch', 'studio pouches');
my @rb_products_plural = map { $_.'s' } @rb_products_singular;

triggers any => (@rb_products_singular, @rb_products_plural, @rb_products_irregular);

# Handle statement
handle query => sub {
    return $_;
};

1;
