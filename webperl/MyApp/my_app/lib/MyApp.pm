package MyApp;
use Mojo::Base 'Mojolicious';

sub startup {
    my $self = shift;

    # Configure the application
    $self->secrets(['your_secret_key']);

    # Router
    my $r = $self->routes;

    # Routes
    $r->get('/')->to('example#welcome');
    $r->get('/sql_injection')->to('sql_injection#index');
    $r->post('/sql_injection/search')->to('sql_injection#search');
}

1;
