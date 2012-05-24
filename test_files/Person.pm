package Person;
use Moose;

has 'first_name' => ( is => 'rw', isa => 'Str', required => 1 );
has 'last_name'  => ( is => 'rw', isa => 'Str', required => 1 );
has 'middle_initial' => (
    is        => 'rw', isa => 'Str',
    predicate => 'has_middle_initial'
);
has 'address' => ( is => 'rw', isa => 'Address' );

sub full_name {
    my $self = shift;
    return $self->first_name
    . (
        $self->has_middle_initial
        ? ' ' . $self->middle_initial . '. '
        : ' '
    ) . $self->last_name;
}
;
