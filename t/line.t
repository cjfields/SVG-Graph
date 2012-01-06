use strict;

use Test::More;
use SVG::Graph;
use SVG::Graph::Data::Datum;

my $graph = SVG::Graph->new( width => 600, height => 600, margin => 30 );

my $group = $graph->add_frame();

my $xval = 1;
my $yval = 1;
my $zval = 1;

my @d = ();
for ( 1 .. 20 ) {
    push @d,
        SVG::Graph::Data::Datum->new(
        x => $xval++,
        y => $yval++,
        z => $zval++
        );
    $xval = $xval % 2;
    $yval = $yval % 3;
    $zval = $zval % 4;
}

my $data = SVG::Graph::Data->new( data => \@d );

$group->add_data($data);

$group->add_glyph('line');

ok($graph->draw());

done_testing();
