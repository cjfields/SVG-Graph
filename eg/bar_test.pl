#!/usr/bin/perl
use lib '~/cvsroot/SVG';

use strict;
use Data::Dumper;
use SVG::Graph;
use SVG::Graph::Data;
use SVG::Graph::Data::Datum;

my $graph = SVG::Graph->new( width => 600, height => 600, margin => 30 );

my $frame0 = $graph->add_frame;
my $frame1 = $frame0->add_frame;
my $frame2 = $frame0->add_frame;
my $frame3 = $frame1->add_frame;

my @d1 = ();
my @d2 = ();
my @d3 = ();

for ( 1 .. 20 ) {
    push @d1, SVG::Graph::Data::Datum->new( x => $_, y => int( rand(50) ) );
}
for ( 1 .. 20 ) {
    push @d2, SVG::Graph::Data::Datum->new( x => $_, y => int( rand(50) ) );
}
for ( 1 .. 20 ) {
    push @d3, SVG::Graph::Data::Datum->new( x => $_, y => int( rand(50) ) );
}

my $data1 = SVG::Graph::Data->new( data => \@d1 );
my $data2 = SVG::Graph::Data->new( data => \@d2 );
my $data3 = SVG::Graph::Data->new( data => \@d3 );

$frame1->add_data($data1);
$frame2->add_data($data2);
$frame3->add_data($data3);

$frame0->add_glyph(
    'axis',
    x_absolute_ticks   => 2,
    y_fractional_ticks => 8,
    'stroke'           => 'black',
    'stroke-width'     => 2
);
$frame1->add_glyph(
    'bar',
    'fill'         => 'red',
    'fill-opacity' => 0.5,
    stroke         => 'red'
);
$frame2->add_glyph(
    'bar',
    'fill'         => 'yellow',
    'fill-opacity' => 0.5,
    stroke         => 'yellow'
);
$frame3->add_glyph(
    'bar',
    'fill'         => 'blue',
    'fill-opacity' => 0.5,
    stroke         => 'blue'
);

print $graph->draw;
