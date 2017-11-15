# kim's nick changes every time someone says kim___ #

use strict;
use warnings;

use Irssi;
use vars qw($VERSION %IRSSI); 

$VERSION = "0.01";
%IRSSI = (
    authors     => "kimspindel",
    contact     => "kimspindel\@gmail.com", 
    name        => "kimnick",
    description => "kim's nick changes every time someone says kim___",
    license     => "Poop License",
);

Irssi::settings_add_str($IRSSI{'name'}, "nick_channels", "#pallkars|#sfml");

sub change_nick {
    my ($server, $msg, $nick, $address, $channel) = @_;
    if(!($channel =~ Irssi::settings_get_str("nick_channels"))) { return 0 }

    if($msg =~ /(?<!\S)(kim[a-zA-Z\d\-\\`\[\]_\^]{3})(?!\S)/)
    {
        $server->command("NICK $1");
    }
}

Irssi::signal_add('message public', 'change_nick');
