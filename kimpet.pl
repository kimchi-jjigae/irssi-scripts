# kim pets someone any time they are sad #

use strict;
use warnings;

use Irssi;
use vars qw($VERSION %IRSSI); 

$VERSION = "0.01";
%IRSSI = (
    authors     => "kimspindel",
    contact     => "kimspindel\@gmail.com", 
    name        => "kimpet",
    description => "kim pets someone any time they are sad",
    license     => "Poop License lolololo",
);

Irssi::settings_add_str($IRSSI{'name'}, "pet_channels", "#channel1|#channel2|#channel3");

sub pet {
    my ($server, $msg, $nick, $address, $channel) = @_;
    if(($channel =~ Irssi::settings_get_str("pet_channels")))
    {
        #if($msg =~ /(?<!\S)(([:=]-?[\(\[\\\/]))|([D\]\)\\\/]-?[:=]])(?!\S)/) ## still gotta check these
        if($msg =~ /[:=]-?[\(\[\\\/]$/) # TODO: add D:
        {
            $server->command("msg $channel \x01ACTION pets $nick\x01");
        }
    }
}

Irssi::signal_add('message public', 'pet');
