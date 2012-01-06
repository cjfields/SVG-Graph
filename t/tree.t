use strict;

use Test::More;

use SVG::Graph;
use SVG::Graph::Data;
use SVG::Graph::Data::Tree;

my %fill = (
    1 => 'red',
    2 => 'orange',
    3 => 'yellow',
    4 => 'green',
    5 => 'blue',
    6 => 'indigo',
    7 => 'violet',
);

ok(my $graph = SVG::Graph->new( width => 600, height => 600, margin => 30 ));

ok(my $group = $graph->add_frame);
isa_ok($group, 'SVG::Graph::Frame');

ok(my $tree = SVG::Graph::Data::Tree->new);

ok($group->add_data($tree));

ok(my $root = $tree->root);
isa_ok($root, 'SVG::Graph::Data::Node');
is($root->branch_length(10), 10);

my @nodes = ();
for my $c ( 0 .. 20 ) {
    my $node = $tree->new_node(
        branch_length  => 10,
        stroke         => $fill{5},
        'stroke-width' => 3
    );
    if ( $c == 1 ) {
        isa_ok($node, 'SVG::Graph::Data::Node');
    }
    if ( $c < 2 ) {
        $root->add_daughter($node);
    }
    else {
        my $rand_parent = $nodes[ $c - 1 ];
        $rand_parent->add_daughter($node);
    }

    push @nodes, $node;
}

ok($group->add_glyph( 'tree', stroke => 'black', 'stroke-width' => 2 ));

ok($graph->draw);
done_testing();