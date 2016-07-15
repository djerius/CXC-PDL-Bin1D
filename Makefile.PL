use PDL::Core::Dev;
use inc::Module::Install;

use File::Spec::Functions qw( catfile );

use strict;
use warnings;

name 'CXC-PDL-Bin1D';

license 'gpl3';
auto_license( holder => 'Smithsonian Astrophysical Observatory' );
all_from 'lib/CXC/PDL/Bin1D.pd';

author_tests( 'xt' );

cpanfile;

provides 'CXC::PDL::Bin1D' => { file => 'lib/CXC/PDL/Bin1D.pd',
				version => version(),
			      };


our @dirh = qw( lib CXC PDL );

our @deps = map { catfile( @dirh, $_ ) }
  qw( bin_err.c bin_err.pd bin_err.pl
      bin_sdev.c bin_sdev.pd bin_sdev.pl );

our $deps = join(' ', @deps );

our @pprec = ( catfile( @dirh, 'Bin1D.pd'), 'Bin1D', 'CXC::PDL::Bin1D' );
my %args = pdlpp_stdargs(\@pprec);

makemaker_args( %args );

my $postamble = pdlpp_postamble(\@::pprec);

# make Bin1D.pm depend upon all of its included files
$postamble =~ s/^(Bin1D.pm:.*)/$1 $::deps/m;

postamble( $postamble );

WriteAll;
