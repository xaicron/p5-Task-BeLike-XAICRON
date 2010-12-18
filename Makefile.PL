use strict;
use warnings;
use ExtUtils::MakeMaker qw/prompt/;
use File::Spec;

my @modules;
for my $name (<DATA>) {
    chomp $name;
    $name =~ /^\s+|\s+$/g;
    next if $name =~ /^#|^$/;
    push @modules, $name;
}

if ($^O eq 'linux') {
    push @modules, qw/Linux::Inotify2/;
}
elsif ($^O eq 'MSWin32') {
    push @modules, qw/Win32::Unicode Win32::GuiTest/;
}

print "$_\n", for @modules;

exit 1 unless lc prompt('Aer you shure to install modules?', 'y') eq 'y';

!system 'which cpanm > ' . File::Spec->devnull or system 'wget -O - http://cpanmin.us | perl - --self-upgrade';
system 'cpanm', @ARGV, @modules;

__END__
# Commands
App::cpanoutdated
App::pmuninstall
App::Ack
Module::Info
Perl::Tidy
Module::CoreList
ShipIt
cpan-upload-http

# Module::Install
Module::Install
Module::Install::Repository
Module::Install::AuthorTests
Module::Install::AuthorRequires
Module::Install::XSUtil
Module::Install::TesTarget

# Test
Test::Requires
Test::Exception
Test::Output
Test::Perl::Critic
Test::Pod
Test::Pod::Coverage
Test::Spelling

# Utils
parent
Class::Accessor
Class::Trigger
UNIVERSAL::require
Encode
Mouse
Scalar::Util
List::MoreUtils
Data::Encoder
Data::Util
Log::Minimal

# File
Path::Class
File::HomeDir
File::ShareDir

# Formater
JSON::XS
JSON
YAML
Data::MessagePack
XML::Simple

# Template
Text::Xslate
Text::MicroTemplate
Template

# Email
Email::Sender
Email::MIME
Email::Simple

# Plack
IO::Handle
Plack
Plack::Middleware::Auth::Digest
Plack::Middleware::ReverseProxy
Plack::Middleware::Deflater
Plack::App::Proxy
Starlet
Starman
Test::WWW::Mechanize::PSGI

# WWW
LWP
URI
URI::Escape
Web::Scraper
WWW::Mechanize
WWW::YouTube::Download

# Term
Term::ANSIColor
Term::Encoding
Term::ReadLine::Gnu

# Development
Devel::NYTProf
Devel::Cover

# Web Development
Router::Simple
Log::Dispatch
URI::Template::Restrict

# Config
Config::Any
Config::Pit

# DBI 
DBI
DBD::mysql
DBD::SQLite
DBIx::DBHResolver
DBIx::Connector

# Event
EV
AnyEvent
Coro

# Others
String::CamelCase
Data::Section::Simple
Data::UUID
Filesys::Notify::Simple
IPC::Open3::Simple
Time::Piece
