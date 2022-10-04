package Pannon::Api;
use Mojo::Base 'Mojolicious::Controller', -signatures;

sub all($c) {
    my $filmek = $c->pg->db->query('SELECT * FROM filmek ORDER BY nev')->hashes;
    $c->render(json => $filmek);
}

sub filtered($c) {
    my $data = $c->req->json;
    my @szimpatikus   = @{$data->{szimpatikus}};
    my @unszimpatikus = @{$data->{unszimpatikus}};

    my $query = 'SELECT * FROM filmek WHERE ';
    $query .= "(kategoria LIKE '%" . pop(@szimpatikus) . "%'";
    $query .= " OR kategoria LIKE '%" . pop(@szimpatikus) . "%'" while (scalar @szimpatikus);
    $query .= ')';
    $query .= " AND kategoria NOT LIKE '%" . pop(@unszimpatikus) . "%'" while (scalar @unszimpatikus);
    $query .= ' ORDER BY nev';

open FH, '>adesz';
print FH "$query\n";
close FH;
    my $filmek = $c->pg->db->query($query)->hashes;

    $c->render(json => $filmek);
}


1;