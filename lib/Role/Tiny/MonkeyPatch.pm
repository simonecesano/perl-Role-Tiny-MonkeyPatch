use strict;
use warnings;

package Role::Tiny::MonkeyPatch;

# ABSTRACT: monkey patch roles into existing classes

use Role::Tiny;

use Sub::Util qw(set_subname);

sub monkey_patch {
    # -----------------------------------------
    # shameless copy paste from Mojo::Util
    # -----------------------------------------
    my ($class, %patch) = @_;
    no strict 'refs';
    no warnings 'redefine';
    *{"${class}::$_"} = set_subname("${class}::$_", $patch{$_}) for keys %patch;
}

sub monkey_patch_role {
    my $class = shift;

    my $p = ((ref $class) || $class) . "::Role::";

    my @roles = map { s/^\+/$p/r } @_;

    if (ref $class) {
	Role::Tiny->apply_roles_to_object($class, @roles);
	return $class
    } else {
	Role::Tiny->apply_roles_to_package($class, @roles);
	return $class
    }
}

sub import {
    my ($class, @packages) = @_;
    for my $package (@packages) {
	monkey_patch $package, "with_roles", sub { monkey_patch_role(@_) };
    }
}

1;

__DATA__
