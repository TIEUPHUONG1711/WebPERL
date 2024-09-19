package MyApp::Controller::SqlInjection;
use Mojo::Base 'Mojolicious::Controller';
use DBI;

sub index {
    my $self = shift;
    $self->render(template => 'sql_injection/index');
}

sub search {
    my $self = shift;

    my $username = $self->param('username');

    # Connect to SQLite database
    my $dbh = DBI->connect('dbi:SQLite:dbname=db/demo.db', '', '', {
        RaiseError => 1,
        PrintError => 0,
    });

    # Use prepared statement to avoid SQL Injection
    my $sth = $dbh->prepare('SELECT * FROM users WHERE username = ?');
    $sth->execute($username);

    my $results = $sth->fetchall_arrayref({});

    $self->render(template => 'sql_injection/results', results => $results);
}

1;
