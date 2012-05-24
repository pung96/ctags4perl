package Employee;
use Moose;

extends 'Person';

has 'title'    => ( is => 'rw', isa => 'Str',     required => 1 );
has 'employer' => ( is => 'rw', isa => 'Company', weak_ref => 1 );

override 'full_name' => sub {
    my $self = shift;
    super() . ', ' . $self->title;
};
1
