package Pannon::Api;
use Mojo::Base 'Mojolicious::Controller', -signatures;

sub all($c) {
    my $filmek = $c->pg->db->query('SELECT * FROM filmek ORDER BY nev')->hashes;
    $c->render(json => $filmek);
#    $c->render(json => [
#        {
#            nev => 'asd',
#            megjelenes_datum => 2001,
#            kategoria => 'vigjatek,krimi',
#        },
#        {
#            nev => 'dfg',
#            megjelenes_datum => 2004,
#            kategoria => 'krimi',
#        },
#    ],
#    );
}

sub filtered($c) {
    my $data = $c->req->json;
    my @szimpatikus   = @{$data->{szimpatikus}};
    my @unszimpatikus = @{$data->{unszimpatikus}};

    my $query = 'SELECT * FROM filmek WHERE ';
    $query .= "kategoria LIKE '%" . pop(@szimpatikus) . "%'";
    $query .= " AND kategoria LIKE '%" . pop(@szimpatikus) . "%'" while (scalar @szimpatikus);
    $query .= " AND kategoria NOT LIKE '%" . pop(@unszimpatikus) . "%'" while (scalar @unszimpatikus);
    $query .= ' ORDER BY nev';

    my $filmek = $c->pg->db->query($query)->hashes;

    $c->render(json => $filmek);
}


1;