package MyUsers;

use strict;
use warnings;

my $USERS = {
    sri     => 'secr3t',
    marcus  =>  'lulz',
    yko     =>  'zeecaptain',
    matt    =>  'rolling'
};

sub new {bless {}, shift}

sub check {
    my ($self, $user, $pass) = @_;

    # Success 
    return 1 if $USERS->{$user} && $USERS->{$user} eq $pass;

    # Fail
    return undef;
}

return 1;
