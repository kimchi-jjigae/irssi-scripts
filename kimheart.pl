$VERSION = "0.01";
%IRSSI = ( 
    authors     => "kimspindel",
    contact     => "kimspindel\@gmail.com", 
    name        => "kimheart",
    description => "kim's messages have loveheart i glyphs instead",
    license     => "Poop License lolololo",
);

Irssi::settings_add_str($IRSSI{'name'}, "heart_channels", "#channel1|#channel2|#channel3");

sub heart {
    my ($cmd, $server, $winitem) = @_; 
#    print($cmd); # -channel "#pallkars-test" hi
#    print($server); # Irssi::Irc::Server=HASH(0x558c8ae041a0)
#    print($winitem); # Irssi::Irc::Channel=HASH(0x558c8adefb30)
    my ($param, $channel, $msg) = $cmd =~ /^(-\S*\s)?(\S*)\s(.*)/;

    if(($channel =~ Irssi::settings_get_str("heart_channels")))
    {   
        if(index($msg, "i") != -1) { # only do something if the message has the letter i in it
            Irssi::signal_stop();
            $msg =~ s/i/❣/g;
            Irssi::signal_emit("command msg", "$channel $msg", $server);
        }   
    }   
}

Irssi::command_bind('msg', 'heart');
