package MyApp::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';

# Định nghĩa hành động welcome
sub welcome {
    my $self = shift;

    # Render template welcome
    $self->render(template => 'example/index');
}

1;
