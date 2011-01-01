#!/usr/bin/perl
# Drop-in replacement for /usr/bin/mail that uses Mail.app (via an
# applescript) rather than sendmail to send mail.  Unlike /usr/bin/mail,
# you can't use it for reading mail.
#
# usage: mail [<options>] <recipients>
#     options:
#         -v           be verbose
#         -g           activate Mail.app to approve the message
#         -F <from>    specify the From: address
#         -b <bcc>     specify Bcc: recipients in a comma-separated list
#         -c <cc>      specify Cc: recipients in a comma-separated list
#         -s <subject> specify the message subject
#
# The body of the message is read from standard input.
#
# Author: Nathaniel Nystrom <nystrom@cs.cornell.edu>
# This software is in the public domain.
#
# Version 1.0,   21 Aug 2003 -- initial version
# Version 1.0.1, 22 Aug 2003 -- fixes some quoting problems
# Version 1.0.2, 23 Aug 2003 -- removed -R <reply-to> option; |reply to|
#                               is a property of _incoming_ messages
# Version 1.0.3, 17 Sep 2003 -- fixed escaping of \ in message body;
#                               escape the subject too

use strict;
$|++;

my ($verbose, $gui);
my ($from, @to, @cc, @bcc, $subject, $body);
my $prog;
($prog = $0) =~ s|.*/||;

while (@ARGV) {
    my $arg = shift @ARGV;

    if ($arg eq '-v') {
        $verbose++;
    }
    elsif ($arg eq '-g') {
        $gui++;
    }
    elsif ($arg eq '-F') {
        $from = shift @ARGV || &usage("missing sender");
    }
    elsif ($arg eq '-i' || $arg eq '-l' || $arg eq '-n') {
        # ignore; for /usr/bin/mail compatibility
    }
    elsif ($arg eq '-N' || $arg eq '-f' || $arg eq '-u') {
        &usage("invalid option $arg; $prog cannot be used for reading mail");
    }
    elsif ($arg eq '-s') {
        $subject = shift @ARGV || &usage("missing subject");
    }
    elsif ($arg eq '-c') {
        my $list = shift @ARGV || &usage("missing Cc list");
        @cc = split /\s*,\s*/, $list;
    }
    elsif ($arg eq '-b') {
        my $list = shift @ARGV || &usage("missing Bcc list");
        @bcc = split /\s*,\s*/, $list;
    }
    elsif ($arg =~ /^-/) {
        &usage("invalid option $arg");
    }
    else {
        @to = ($arg, @ARGV);
        last;
    }
}

&usage("missing recipients") unless @to;

unless (defined $subject) {
    print "Subject: ";
    $subject = <STDIN> || '';
    chomp $subject;
}

$body = '';

while (<STDIN>) {
    $body .= $_;
}

$body = &escape($body);
$subject = &escape($subject);

my $script = <<"EOS";
tell application "Mail"
    set newMessage to make new outgoing message
    tell newMessage
        set subject to "$subject"
        set content to "$body"
EOS

for (@to)  { $script .= &recipient('to', $_); }
for (@cc)  { $script .= &recipient('cc', $_); }
for (@bcc) { $script .= &recipient('bcc', $_); }

my $visible = $gui ? "true" : "false";
my $activate = $gui ? "activate" : "send newMessage";
my $fromln = $from ? "set sender to \"$from\"" : "";

$script .= <<"EOS";
        $fromln
        set visible to $visible
    end tell
    $activate
end tell
EOS

if ($verbose >= 1) {
    print "From: $from\n" if $from;
    print "To: ", join(',', @to), "\n" if @to;
    print "Cc: ", join(',', @cc), "\n" if @cc;
    print "Bcc: ", join(',', @bcc), "\n" if @bcc;

    if ($verbose >= 2) {
        print "Script >>>\n";
        print $script;
        print "<<<\n";
        print "\n";
        print $body;
    }
}

open(SCRIPT, "| osascript > /dev/null") || die "Couldn't fork osascript: $!\n";
print SCRIPT $script;
close SCRIPT;

exit 0;

sub escape {
    my $x = shift;
    $x =~ s/\\/\\\\/gm;
    $x =~ s/"/\\"/gm;
    $x =~ s/\n/\\n/gm;
    $x;
}

sub recipient {
    my ($type,$addr) = @_;
    return <<"EOS"
        make new $type recipient at end of $type recipients with properties {address: "$addr"}
EOS
}

sub usage {
    my $error = shift;
    print STDERR "Error: $error\n" if $error;
    print STDERR <<"EOS";
usage: $prog [<options>] <recipients>
    options:
        -v           be verbose
        -g           activate Mail.app to approve the message
        -F <from>    specify the From: address
        -b <bcc>     specify Bcc: recipients in a comma-separated list
        -c <cc>      specify Cc: recipients in a comma-separated list
        -s <subject> specify the message subject
EOS
    exit 1;
}
