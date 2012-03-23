package Parse::Number::EN;

# TODO: make it OO and customize thousand sep & decimal point

use 5.010;
use strict;
use warnings;

our $VERSION = '0.03'; # VERSION

use Exporter::Lite;
our @EXPORT_OK = qw($Pat parse_number_en);

our %SPEC;

our $Pat = qr/(?:
                  [+-]?
                  (?:
                      (?:\d{1,3}(?:[,]\d{3})+ | \d+) (?:[.]\d*)? | # english
                      [.]\d+
                  )
                  (?:[Ee][+-]?\d+)?
              )/x;

$SPEC{parse_number_en} = {
    summary => 'Parse number from English text',
    args    => {
        text => ['str*' => {
            summary => 'The input text that contains number',
        }],
    },
    result_naked => 1,
};
sub parse_number_en {
    my %args = @_;
    my $text = $args{text};

    return undef unless $text =~ s/^\s*($Pat)//s;
    my $n = $1;
    $n =~ s/,//g;
    $n+0;
}

1;
# ABSTRACT: Pattern to match number


=pod

=head1 NAME

Parse::Number::EN - Pattern to match number

=head1 VERSION

version 0.03

=head1 SYNOPSIS

 use Parse::Number::EN qw(parse_number_en $Pat);

 my @a = map {parse_number_id(text=>$_)}
     ("12,345.67", "-1.2e3", "x123", "1.23", "1,23");
 # @a = (12345.67, -1200, undef, 1.23, 1)

 my @b = map {/^$Pat$/ ? 1:0}
     ("12,345.67", "-1.2e3", "x123", "1,23");
 # @b = (1, 1, 0, 0)

=head1 DESCRIPTION

This module provides $Pat and parse_number_en().

=head1 VARIABLES

None are exported by default, but they are exportable.

=head2 $Pat (REGEX)

A regex for quickly matching/extracting number from text. It's not 100% perfect
(the extracted number might not be valid), but it's simple and fast.

=head1 FUNCTIONS

None are exported by default, but they are exportable.

=head1 SEE ALSO

L<Lingua::EN::Words2Nums>

Other Parse::Number::* modules.

=head1 FUNCTIONS


=head2 parse_number_en(%args) -> [status, msg, result, meta]

Parse number from English text.

Arguments ('*' denotes required arguments):

=over 4

=item * B<text>* => I<str>

The input text that contains number.

=back

Return value:

Returns an enveloped result (an array). First element (status) is an integer containing HTTP status code (200 means OK, 4xx caller error, 5xx function error). Second element (msg) is a string containing error message, or 'OK' if status is 200. Third element (result) is optional, the actual result. Fourth element (meta) is called result metadata and is optional, a hash that contains extra information.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

