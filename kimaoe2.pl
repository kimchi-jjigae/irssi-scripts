# kim taunts with Age of Empires 2 taunts everytime someone writes a number #

use strict;
use warnings;

use Irssi;
use vars qw($VERSION %IRSSI); 

$VERSION = "0.01";
%IRSSI = (
    authors     => "kimspindel",
    contact     => "kimspindel\@gmail.com", 
    name        => "kimnick",
    description => "kim taunts with Age of Empires 2 taunts everytime someone writes a number",
    license     => "Poop License",
);

Irssi::settings_add_str($IRSSI{'name'}, "aoe_channels", "#channel1|#channel2|#channel3");

sub AoE2 {
    my ($server, $msg, $nick, $address, $channel) = @_;
    if(!($channel =~ Irssi::settings_get_str("aoe_channels"))) { return 0 }

    if($msg =~ /(?<!\S)(\d{1,2})(?!\S)/)
    {
        my $taunt;
        if   ($1 ==  1) { $taunt = "Yes."; }
        elsif($1 ==  2) { $taunt = "No."; }
        elsif($1 ==  3) { $taunt = "Food please."; }
        elsif($1 ==  4) { $taunt = "Wood please."; }
        elsif($1 ==  5) { $taunt = "Gold please."; }
        elsif($1 ==  6) { $taunt = "Stone please."; }
        elsif($1 ==  7) { $taunt = "Ahhh!"; }
        elsif($1 ==  8) { $taunt = "All hail, king of the losers!"; }
        elsif($1 ==  9) { $taunt = "Ooooh!"; }
        elsif($1 == 10) { $taunt = "I'll beat you back to Age of Empires."; }
        elsif($1 == 11) { $taunt = "HAAA hahahaha ha ha haaa... HA!"; }
        elsif($1 == 12) { $taunt = "AH! Being rushed!"; }
        elsif($1 == 13) { $taunt = "Sure, blame it on your ISP."; }
        elsif($1 == 14) { $taunt = "Start the game already!"; }
        elsif($1 == 15) { $taunt = "Don't point that thing at me!"; }
        elsif($1 == 16) { $taunt = "Enemy sighted!"; }
        elsif($1 == 17) { $taunt = "It is GOOD to be the king."; }
        elsif($1 == 18) { $taunt = "Monk! I need a mooonk!"; }
        elsif($1 == 19) { $taunt = "Long time, no siege."; }
        elsif($1 == 20) { $taunt = "My granny could scrap better than that."; }
        elsif($1 == 21) { $taunt = "Nice town. I'll take it."; }
        elsif($1 == 22) { $taunt = "Quit touchin' me!"; }
        elsif($1 == 23) { $taunt = "RAIDING PARTY!"; }
        elsif($1 == 24) { $taunt = "Dadgun."; }
        elsif($1 == 25) { $taunt = "Ehhhh, smite me."; }
        elsif($1 == 26) { $taunt = "The wonder, the wonder, the... noooooo!"; }
        elsif($1 == 27) { $taunt = "You played two hours to die like THIS?"; }
        elsif($1 == 28) { $taunt = "Yeah well, you should see the other guy."; }
        elsif($1 == 29) { $taunt = "Roggan."; }
        elsif($1 == 30) { $taunt = "Wololoooooo."; }
        elsif($1 == 31) { $taunt = "Attack an enemy now."; }
        elsif($1 == 32) { $taunt = "Cease creating extra villagers."; }
        elsif($1 == 33) { $taunt = "Create extra villagers."; }
        elsif($1 == 34) { $taunt = "Build a navy."; }
        elsif($1 == 35) { $taunt = "Stop building a navy."; }
        elsif($1 == 36) { $taunt = "Wait for my signal to attack."; }
        elsif($1 == 37) { $taunt = "Build a wonder."; }
        elsif($1 == 38) { $taunt = "Give me your extra resources."; }
        elsif($1 == 39) { $taunt = "*pling pling PLING!* (ally)"; }
        elsif($1 == 40) { $taunt = "*PANG!* (enemy)"; }
        elsif($1 == 41) { $taunt = "*thoo thoothoo thoot* (neutral)"; }
        elsif($1 == 42) { $taunt = "What age are you in?"; }
        if($taunt) {
            $server->command("msg $channel $taunt");
        }
    }
}

Irssi::signal_add('message public', 'AoE2');
