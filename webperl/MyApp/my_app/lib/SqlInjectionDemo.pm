package SqlInjectionDemo;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
    my $self = shift;


    # Router
    my $r = $self->routes;

    # Define routes
    $r->get('/')->to('example#index');
    $r->post('/search')->to('example#search');
}

1;