package MyApp::Login;

use Mojo::Base 'Mojolicious::Controller';

sub index {
    my $self = shift;

    # grab request parameters
    my $user = $self->param('user') || '';
    my $pass = $self->param('pass') || '';
    
    # check the password
    return $self->render unless $self->users->check($user, $pass);
    
    # store username in session
    $self->session(user => $user);

    # message for next page stored in flash
    $self->flash(message => "Thanks for logging in $user!");

    # redirect to protected page with a 302 response
    $self->redirect_to('protected');
}

sub logged_in {
    my $self = shift;

    return $self->session('user') || !$self->redirect_to("index");
}

sub logout {
    my $selfLogout = shift;

    # expire and clear session automatically
    $selfLogout->session(expires => 1);

    # redirect to main page with a 302 response
    $selfLogout->redirect_to('index');

}

return 1;
