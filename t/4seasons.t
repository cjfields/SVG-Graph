use strict;

use Test::More;

use SVG;
use SVG::Graph;
use SVG::Graph::Data::Datum;

ok(my $svg = SVG->new( width => 800, height => 800 ));

my $graph_summer = SVG::Graph->new(
    svg     => $svg,
    width   => 400,
    height  => 400,
    xoffset => 0,
    yoffset => 0,
    margin  => 30
);
my $graph_winter = SVG::Graph->new(
    svg     => $svg,
    width   => 400,
    height  => 400,
    xoffset => 400,
    yoffset => 0,
    margin  => 30
);
my $graph_autumn = SVG::Graph->new(
    svg     => $svg,
    width   => 400,
    height  => 400,
    xoffset => 0,
    yoffset => 400,
    margin  => 30
);
my $graph_spring = SVG::Graph->new(
    svg     => $svg,
    width   => 400,
    height  => 400,
    xoffset => 400,
    yoffset => 400,
    margin  => 30
);

my $group_summer = $graph_summer->add_frame();
my $group_winter = $graph_winter->add_frame();
my $group_autumn = $graph_autumn->add_frame();
my $group_spring = $graph_spring->add_frame();

my @d_summer = ();
my @d_winter = ();
my @d_autumn = ();
my @d_spring = ();

my $xval = 1;
my $yval = 1;
my $zval = 1;

for ( 1 .. 20 ) {
    push @d_summer,
        SVG::Graph::Data::Datum->new(
        x => $xval++,
        y => $yval++,
        z => $zval++
        );
    $xval = $xval % 2;
    $yval = $yval % 3;
    $zval = $zval % 4;
}
for ( 1 .. 20 ) {
    push @d_winter,
        SVG::Graph::Data::Datum->new(
        x => $xval++,
        y => $yval++,
        z => $zval++
        );
    $xval = $xval % 2;
    $yval = $yval % 3;
    $zval = $zval % 4;

}
for ( 1 .. 20 ) {
    push @d_autumn,
        SVG::Graph::Data::Datum->new(
        x => $xval++,
        y => $yval++,
        z => $zval++
        );
    $xval = $xval % 2;
    $yval = $yval % 3;
    $zval = $zval % 4;
}
for ( 1 .. 20 ) {
    push @d_spring,
        SVG::Graph::Data::Datum->new(
        x => $xval++,
        y => $yval++,
        z => $zval++
        );
    $xval = $xval % 2;
    $yval = $yval % 3;
    $zval = $zval % 4;
}

my $data_summer = SVG::Graph::Data->new( data => \@d_summer );
my $data_winter = SVG::Graph::Data->new( data => \@d_winter );
my $data_autumn = SVG::Graph::Data->new( data => \@d_autumn );
my $data_spring = SVG::Graph::Data->new( data => \@d_spring );

$group_summer->add_data($data_summer);
$group_winter->add_data($data_winter);
$group_autumn->add_data($data_autumn);
$group_spring->add_data($data_spring);

$group_summer->add_glyph(
    'bubble',
    'fill'         => 'orange',
    'fill-opacity' => 0.5
);
$group_winter->add_glyph( 'bubble', 'fill' => 'cyan', 'fill-opacity' => 0.5 );
$group_autumn->add_glyph( 'bubble', 'fill' => 'red',  'fill-opacity' => 0.5 );
$group_spring->add_glyph(
    'bubble',
    'fill'         => 'green',
    'fill-opacity' => 0.5
);
$group_summer->add_glyph('axis');
$group_winter->add_glyph('axis');
$group_autumn->add_glyph('axis');
$group_spring->add_glyph('axis');

$graph_summer->draw();
$graph_winter->draw();
$graph_autumn->draw();
$graph_spring->draw();

ok($svg->xmlify);

done_testing();
