#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Spice;

spice is_cached => 0;

ddg_spice_test(
    [qw( DDG::Spice::Redbubble)],
    # At a minimum, be sure to include tests for all:
    # - primary_example_queries (plural forms)

    'flower pencil-skirts' => test_spice(
        '/js/spice/redbubble/flower%20pencil-skirts',
        call_type => 'include',
        caller => 'DDG::Spice::Redbubble'
    ),

    'rainbow art prints' => test_spice(
        '/js/spice/redbubble/rainbow%20art%20prints',
        call_type => 'include',
        caller => 'DDG::Spice::Redbubble'
    ),

    'tatoo stickers' => test_spice(
        '/js/spice/redbubble/tatoo%20stickers',
        call_type => 'include',
        caller => 'DDG::Spice::Redbubble'
    ),

    'colorful greeting-cards' => test_spice(
        '/js/spice/redbubble/colorful%20greeting-cards',
        call_type => 'include',
        caller => 'DDG::Spice::Redbubble'
    ),

    # - primary_example_queries (singular forms)

    'jellyfish duvet cover' => test_spice(
        '/js/spice/redbubble/jellyfish%20duvet%20cover',
        call_type => 'include',
        caller => 'DDG::Spice::Redbubble'
    ),

    'flowers t-shirt' => test_spice(
        '/js/spice/redbubble/flowers%20t-shirt',
        call_type => 'include',
        caller => 'DDG::Spice::Redbubble'
    ),

    'tropical iphone case' => test_spice(
        '/js/spice/redbubble/tropical%20iphone%20case',
        call_type => 'include',
        caller => 'DDG::Spice::Redbubble'
    ),

    # - secondary_example_queries
    #   (scrambled terms, muliple triggers)

    't-shirt flowers' => test_spice(
        '/js/spice/redbubble/t-shirt%20flowers',
        call_type => 'include',
        caller => 'DDG::Spice::Redbubble'
    ),

    'hare sticker art print' => test_spice(
        '/js/spice/redbubble/hare%20sticker%20art%20print',
        call_type => 'include',
        caller => 'DDG::Spice::Redbubble'
    ),

    # Try to include some examples of queries on which it might
    # appear that your answer will trigger, but does not.
    #  - valid_but_unsupported_queries (split trigger)

    'art hare print' => undef,

    # - invalid_queries (triggers only)

    #'calendars' => undef,
    #'studio pouch' => undef,
    #'posters metal prints' => undef,
);

done_testing;

