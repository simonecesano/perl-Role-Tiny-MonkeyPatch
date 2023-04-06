# Role::Tiny::MonkeyPatch

## NAME

Role::Tiny::MonkeyPatch - monkeypatch roles into existing classes

## SYNOPSIS

    use Role::Tiny::MonkeyPatch qw/Some::Existing::Class/;

    my $something = Some::Existing::Class->new->withroles('+Some::Role');

    $something->some_method_provided_by_role

or

    use Role::Tiny::MonkeyPatch;

    my $something = Some::Existing::Class->new;

    monkey_patch_roles($something);

    $something->some_method_provided_by_role

or

    use Role::Tiny::MonkeyPatch;

    monkey_patch_roles(Some::Existing::Class);

    my $something = Some::Existing::Class->new;

    $something->some_method_provided_by_role

## DESCRIPTION

Role::Tiny::MonkeyPatch monkey patches Role::Tiny-based roles onto existing modules

## FUNCTIONS

Role::Tiny::MonkeyPatch exports only one function

### monkey\_patch\_roles

    monkey_patch_roles(Some::Class);

or 

    my $obj = Some::Class->new;
    monkey_patch_roles($obj);

monkey patch roles onto an existing class or object

## CAVEATS AND NOTES

Be aware that Mojo::Base roles only work on hash-based classes

## SEE ALSO

- Role::Tiny
- Mojo::Util

## AUTHORS

Simone Cesano

## COPYRIGHT AND LICENSE

This software is copyright (c) 2023 by Simone Cesano.

This is free software; you can redistribute it and/or modify it under the same terms as the Perl 5 programming language system itself.
