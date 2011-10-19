package Parse::Number::EN;

# TODO: make it OO and customize thousand sep & decimal point

use 5.010;
use strict;
use warnings;

our $VERSION = '0.01'; # VERSION

use Exporter::Lite;
our @EXPORT_OK = qw($Pat);

our $Pat = qr/(?:
                  [+-]?
                  (?:
                      \d{1,2}([,]\d{3})*(?:[.]\d*)? | # english
                      [,.]\d+ |
                      \d+
                  )
                  (?:[Ee][+-]?\d+)?
              )/x;

1;
# ABSTRACT: Pattern to match number


=pod

=head1 NAME

Parse::Number::EN - Pattern to match number

=head1 VERSION

version 0.01

=head1 SYNOPSIS

 use Parse::Number::EN qw($Pat);

 my @a = map {/^$Pat$/ ? 1:0}
     ("12,345.67", "-1.2e3", "x123", "1,23");
 # @a = (1, 1, 0, 0)

=head1 DESCRIPTION

This module provides $Pat.

=head1 VARIABLES

None are exported by default, but they are exportable.

=head2 $Pat (REGEX)

A regex for quickly matching/extracting number from text. It's not 100% perfect
(the extracted number might not be valid), but it's simple and fast.

=head1 SEE ALSO

L<Lingua::EN::Words2Nums>

Other Parse::Number::* modules.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

