package Pannon;
use Mojo::Base 'Mojolicious', -signatures;
use Mojo::Pg;

#helper 'pg' => sub { state $pg = Mojo::Pg->new('postgresql://localhost/pannon') };

# This method will run once at server start
sub startup ($self) {

  # Load configuration from config file
  my $config = $self->plugin('NotYAMLConfig');
  $self->helper('pg' => sub { state $pg = Mojo::Pg->new('postgresql://localhost/pannon') });

  # Configure the application
  $self->secrets($config->{secrets});

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('site#get');
  $r->get('/all')->to('api#all');
  $r->post('/filtered')->to('api#filtered');
  
  $r->get('/vue')->to(cb => sub ($c) {
    $c->reply->static('dist/index.html');
  });
}

1;
