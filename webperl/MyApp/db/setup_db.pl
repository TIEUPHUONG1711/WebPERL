#!/usr/bin/env perl
use strict;
use warnings;
use DBI;

my $dbh = DBI->connect('dbi:SQLite:dbname=demo.db', '', '', {
    RaiseError => 1,
    PrintError => 0,
}) or die $DBI::errstr;

$dbh->do('CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL,
    password TEXT NOT NULL
)');

$dbh->do('INSERT INTO users (username, password) VALUES (?, ?)', undef, 'admin', 'password123');
$dbh->do('INSERT INTO users (username, password) VALUES (?, ?)', undef, 'user1', 'pass1');

$dbh->disconnect;
