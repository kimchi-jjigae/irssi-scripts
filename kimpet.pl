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

print("real banananananana\n");

Irssi::settings_add_str($IRSSI{'name'}, "pet_channels", "#infp|#Ikaruga|#ikaruga|#pallkars|#sfml|#hax|#petbot");
#Irssi::settings_add_str($IRSSI{'name'}, "pet_channels", "#petbot");

sub pet {
    my ($server, $msg, $nick, $address, $channel) = @_;
    if(($channel =~ Irssi::settings_get_str("pet_channels")))
    {
        #if($msg =~ /(?<!\S)(([:=]-?[\(\[\\\/]))|([D\]\)\\\/]-?[:=]])(?!\S)/) ## still gotta check these
        if($msg =~ /[:=]-?[\(\[\\\/]$/)
        {
            print("In: $channel | Petting: $nick");
            $server->command("msg $channel \x01ACTION pets $nick\x01");
        }
        else
        {
        }
    }
    else
    {
        return 0;
    }

}

Irssi::signal_add('message public', 'pet');
