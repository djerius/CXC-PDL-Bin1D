#!perl

requires 'PDL';

on configure => sub {
   requires 'PDL::Core::Dev';
   requires 'File::Spec::Functions';
};


on test => sub {

   requires 'PDL';
   requires 'Test::More';
};


on develop => sub {

    requires 'Module::Install';
    requires 'Module::Install::AuthorRequires';
    requires 'Module::Install::AuthorTests';
    requires 'Module::Install::AutoLicense';
    requires 'Module::Install::CPANfile';

    requires 'Test::Fixme';
    requires 'Test::NoBreakpoints';
    requires 'Test::Pod';
    requires 'Test::Pod::Coverage';
    requires 'Test::Perl::Critic';
    requires 'Test::CPAN::Changes';
    requires 'Test::CPAN::Meta';
};
