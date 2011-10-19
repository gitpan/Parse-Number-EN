#!perl

use 5.010;
use strict;
use warnings;
use Parse::Number::EN qw($Pat);
use Test::More 0.96;

my %test_pat = (
    "1" => 1,
    "1.23" => 1,
    "+1.23" => 1,
    "1,23" => 0,
    "-1,23" => 0,
    "9e-1" => 1,
    "9.1e+2" => 1,
    "9,13e3" => 0,
    "9,000,000" => 1,
    "9.000.000" => 0,
    "9,000.3" => 1,
    "90.000,4" => 0,

    "abc" => 0,
    "1abc" => 0,
    "abc2" => 0,
    "e" => 0,
    "e3" => 0,
    "++1" => 0,
    "9,000,4" => 0,
    "9.000.5" => 0,
    "9,000,0000" => 0,
    "9.000.0000" => 0,
);

for (sort keys %test_pat) {
    my $match = $_ =~ /\A$Pat\z/;
    if ($test_pat{$_}) {
        ok($match, "'$_' matches");
    } else {
        ok(!$match, "'$_' doesn't match");
    }
}

DONE_TESTING:
done_testing();
