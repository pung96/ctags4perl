package Company;
use Moose;
use Moose::Util::TypeConstraints;

has 'name' => ( is => 'rw', isa => 'Str', required => 1 );
has 'address'   => ( is => 'rw', isa => 'Address' );
has 'employees' => (
    is      => 'rw',
    isa     => 'ArrayRef[Employee]',
    default => sub { [] },
);

sub BUILD {
    my ( $self, $params ) = @_;
    foreach my $employee ( @{ $self->employees } ) {
        $employee->employer($self);
    }
}

after 'employees' => sub {
    my ( $self, $employees ) = @_;
    return unless $employees;
    foreach my $employee ( @$employees ) {
        $employee->employer($self);
    }
};

1;
