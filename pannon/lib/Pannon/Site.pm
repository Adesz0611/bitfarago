package Pannon::Site;
use Mojo::Base 'Mojolicious::Controller', -signatures;

sub get($c) {
    $c->reply->static('index.html');
}


1;
