package DDG::Spice::Redbubble;

# ABSTRACT: Search for available products.

use DDG::Spice;

# Caching - http://docs.duckduckhack.com/backend-reference/api-reference.html#caching
spice is_cached => 0;
spice proxy_cache_valid => "200 304 1d";

spice wrap_jsonp_callback => 0; # only enable for non-JSONP APIs (i.e. no &callback= parameter)

# API endpoint - http://docs.duckduckhack.com/walkthroughs/forum-lookup.html#api-endpoint
spice to => 'http://example.com/search/$1';

# Triggers - https://duck.co/duckduckhack/spice_triggers
# The exact Redbubble product names.
triggers any => 't-shirts', 'leggings', 'scarves', 'pencil skirts', 'kid clothes',
                'iphone cases', 'samsung galaxy cases', 'ipad cases', 'laptop skins', 'laptop sleves',
                'stickers',
                'posters', 'canvas prints', 'photographic prints', 'art prints', 'framed prints', 'metal prints',
                'throw pillows', 'duvet covers', 'mugs', 'travel mugs',
                'greeting cards', 'postcards', 'calendars', 'spiral notebooks', 'hardcover journals',
                'tote bags', 'studio pouches', 'drawstring bags';

# Handle statement
handle query => sub {
    return $_;
};

1;
