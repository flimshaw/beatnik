#!/usr/bin/perl
#######################################################
#
# "The shoe-maker on earth that had the soul of a poet
#       in him won't have to make shoes here."
#
#                                     -Mark Twain
#
#######################################################
#
# Beatnik Box - Version 2.08 Alpha
#
# Programming Begins 11.10.03 at 8:32pm
# at 859 N. 21st Street, Apt #2, Philadelphia, PA 19130
#
# The Brainchild of Charles RMC Hoey
# Intended for a Video Installation
# 
#######################################################
#
# Day 9: 12.3.03 8:18pm
# Neutral Milk Hotel
#
# Finally getting back to the code.  The hardware is
# getting built.  I have a screen, and I put the 
# plexiglass box together today.  Tomorrow I should get
# the motherboard and stuff in the mail.  The time grows
# nigh.  This thing is due in five days.  I want to add
# a receipt printer to the mix, but i'm not sure if I can
# get one in time...
#
#######################################################
print "Content-type: text/html\n\n";
print "<HTML><HEAD><TITLE>Beatnik v. 2.08 Alpha - PROTOTYPE</TITLE></HEAD><BODY>\n";
print "<BLOCKQUOTE>\n";
# Clean your screen
system("clear");

# I'll flush YO MOMMA's buffer
$| = 1;

# read the text files into the word array

open(PROPOS, 'pronoun.pos');
@propos = <PROPOS>;
close(PROPOS);

open(PROSUB, 'pronoun');
@prosub = <PROSUB>;
close(PROSUB);

open(PROOBJ, 'pronoun.obj');
@proobj = <PROOBJ>;
close(PROOBJ);

open(ARTICLES, 'article');
@article = <ARTICLES>;
close(ARTICLES);

open(VERBT, 'verbs.trans');
@verbstrans = <VERBT>;
close(VERBT);

open(VERBINT, 'verbs.intrans');
@verbsintrans = <VERBINT>;
close(VERBINT);

open(ADJ, 'adjective');
@adjectives = <ADJ>;
close(ADJ);

open(ADV, 'adverb');
@adverbs = <ADV>;
close(ADV);

open(NOUNT, 'nouns.things');
@nounthings = <NOUNT>;
close(NOUNT);

open(NOUNPE, 'nouns.people');
@nounpeople = <NOUNPE>;
close(NOUNPE);

open(NOUNPL, 'nouns.places');
@nounplaces = <NOUNPL>;
close(NOUNPL);

open(PREP, 'preposition');
@prepositions = <PREP>;
close(PREP);

open(CONJ, 'conjunction');
@conjunction = <CONJ>;
close(CONJ);

while(!$jerk) {
$jerk = 1;
print "Poem #$kerouacs_reefer<BR><BR>";
srand (time ^ $$ ^ unpack "%L*", `ps axww | gzip`);
# Ezra Pound determines how many lines/words the poem will be
sub pound{

	$lines = int( rand(15)) + 3;

	$words = int( rand(8)) + 3;

}

# Allan Ginsberg decides the poem structure for Ezra's value
sub ginsberg{
	
	# define the poem array per Pound's instructions
	$poem[$_[0]][$_[1]];
	
	# pick a random number of words for each line
	for($lines; $i < $lines; $i++) {
		$wordcount[$i] = int( rand($words)) +1;
	}
	$i = 0;
	# define each line
	for($lines; $i < $lines; $i++) {
		# $flaggo lets it know it's the first word in a line
		$flaggo = 1;
		for($wordcount[$i]; $x < $wordcount[$i]; $x++) {
		# determine what type of word it will be
		# The following is a key for word types:
		# 0 = article
		# 1 = verb.trans
		# 2 = verb.intrans
		# 3 = adjective
		# 4 = adverb
		# 5 = noun.thing
		# 6 = noun.person
		# 7 = noun.place
		# 8 = preposition
		# 9 = conjunction
		# 10 = possessive pronoun
		# 11 = subjective pronoun
		# 12 = objective pronoun
		# if it's not the first word, then strunk it...
		if (!($flaggo)) {
			$type = strunk($i, $x);
		# if it's the only word in a sentence...
		} elsif($wordcount[$i] == 1) {
			@goods = (1, 2, 3, 4);
			$val = int( rand(4)) + 0;
			$type = $goods[$val];
		# otherwise, pick a random word type yourself
		} else { 
			$type = int( rand(11)) + 0;
			$flaggo--;
		}
		$poem[$i][$x] = $type;
		}
		# reset the word counter for the next line
		$x = 0;
	}

}

# Strunk checks to see what words are valid for input by looking at
# the part of speech of the previous word used
sub strunk{
	$privy = $_[1] - 1;
	$prevword = $poem[$_[0]][$privy];
	$nowword = $_[1] + 1;
		# if there's only one word on the line
		if($wordcount[$_[0]] < 2) {
			@goods = (1, 2, 9);
			$val = int( rand(3)) + 0;
			return $goods[$val];
		# if the previous word is an article
		# NOTE: 10:22pm, testing a theory that clause lookouts only
		# _really_ have to be in place if we're talking about the last
		# word in a sentence...
		} elsif($prevword == 0) {
			if($wordcount[$_[0]] == $nowword) {
				@goods = (5, 6, 7);
				$val = int( rand(3)) + 0;
				return $goods[$val];
			} else {
				@goods = (3, 4, 5, 6, 7);
				$val = int( rand(5)) + 0;
				return $goods[$val];
			}
		} elsif($prevword == 1) {
			if($wordcount[$_[0]] == $nowword) {
                                @goods = (4, 5, 6, 7, 12);
                                $val = int( rand(5)) + 0;
                                return $goods[$val];
                        } else {
				@goods = (3, 4, 5, 6, 7, 9, 10, 12);
				$val = int( rand(8)) + 0;
				return $goods[$val];
			}
		} elsif($prevword == 2) {
			if($wordcount[$_[0]] == $nowword) {
#                                @goods = (4);
#                                $val = int( rand(3)) + 0;
#                                return $goods[$val];
				 return 4;
                        } else {
				@goods = (4, 8, 9);
				$val = int ( rand(3)) + 0;
				return $goods[$val];
			}
		} elsif($prevword == 3) {
			if($wordcount[$_[0]] == $nowword) {
                                @goods = (5, 6, 7, 12);
                                $val = int( rand(4)) + 0;
                                return $goods[$val];
                        } else {
				@goods = (5, 6, 7, 12);
				$val = int ( rand(4)) + 0;
				return $goods[$val];
			}
		} elsif($prevword == 4) {
			if($wordcount[$_[0]] == $nowword) {
#                                @goods = (5, 6, 7);
 #                               $val = int( rand(3)) + 0;
  #                              return $goods[$val];
   				 return 1;
                        } else {
				@goods = (1, 2, 3, 4, 10);
				$val = int ( rand(5)) + 0;
				return $goods[$val];
			}
		} elsif($prevword > 4 && $prevword < 8) {
			if($wordcount[$_[0]] == $nowword) {
#                                @goods = (5, 6, 7);
#                                $val = int( rand(3)) + 0;
#                                return $goods[$val];
				 return 4;
                        } else {
				@goods = (9, 4);
				$val = int ( rand(2)) + 0;
				return $goods[$val];
			}
		} elsif($prevword == 8) {
			if($wordcount[$_[0]] == $nowword) {
                                @goods = (4, 5, 6, 7);
                                $val = int( rand(4)) + 0;
                                return $goods[$val];
                        } else {
				@goods = (3, 5, 6, 7, 10);
				$val = int ( rand(5)) + 0;
				return $goods[$val];
			}
		} elsif($prevword == 9) {
			@goods = (0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 11);
			$val = int ( rand(11)) + 0;
			return $goods[$val];
		} elsif($prevword == 10) { 
			@goods = (5, 6, 7);
			$val = int ( rand(3)) + 0;
			return $goods[$val];
		} elsif($prevword == 11) {
			@goods = (1, 2);
			$val = int ( rand(2)) + 0;
			return $goods[$val];
		} elsif($prevword == 12) {
			@goods = (9, 4);
			$val = int ( rand(2)) + 0;
			return $goods[$val];
		} else {
			$val = int ( rand(12)) + 0;
			return $val;
		}
}

# Jack Kerouac decides which words to place into the poem Ginsberg and
# Strunk have designed.

sub kerouac{
	$b = 0;	
	# for each line
	for($lines; $b < $lines; $b++) {
		$c = 0;
		# for each word in this line
		for($wordcount[$b]; $c < $wordcount[$b]; $c++){
			print "$poem[$b][$c]";				
			if($poem[$b][$c] == 1) {
				$scratch = int ( rand(@verbstrans)) + 0;
				chomp($verbstrans[$scratch]);
				$poem[$b][$c] = $verbstrans[$scratch];
			} elsif($poem[$b][$c] == 2) {
				$scratch = int ( rand(@verbsintrans)) + 0;
                                chomp($verbsintrans[$scratch]);
				$poem[$b][$c] = $verbsintrans[$scratch];
			} elsif($poem[$b][$c] == 3) {
                                $scratch = int ( rand(@adjectives)) + 0;
                                chomp($adjectives[$scratch]);
                                $poem[$b][$c] = $adjectives[$scratch];
                        } elsif($poem[$b][$c] == 4) {
                                $scratch = int ( rand(@adverbs)) + 0;
                                chomp($adverbs[$scratch]);
                                $poem[$b][$c] = $adverbs[$scratch];
                        } elsif($poem[$b][$c] == 5) {
                                $scratch = int ( rand(@nounthings)) + 0;
                                chomp($nounthings[$scratch]);
                                $poem[$b][$c] = $nounthings[$scratch];
                        } elsif($poem[$b][$c] == 6) {
                                $scratch = int ( rand(@nounpeople)) + 0;
                                chomp($nounpeople[$scratch]);
                                $poem[$b][$c] = $nounpeople[$scratch];
                        } elsif($poem[$b][$c] == 7) {
                                $scratch = int ( rand(@nounplaces)) + 0;
                                chomp($nounplaces[$scratch]);
                                $poem[$b][$c] = $nounplaces[$scratch];
                        } elsif($poem[$b][$c] == 8) {
                                $scratch = int ( rand(@prepositions)) + 0;
                                chomp($prepositions[$scratch]);
                                $poem[$b][$c] = $prepositions[$scratch];
                        } elsif($poem[$b][$c] == 9) {
                                $scratch = int ( rand(@conjunction)) + 0;
                                chomp($conjunction[$scratch]);
                                $poem[$b][$c] = $conjunction[$scratch];
			} elsif($poem[$b][$c] == 10) {
				$scratch = int ( rand(@propos)) + 0;
				chomp($propos[$scratch]);
				$poem[$b][$c] = $propos[$scratch];
                     	} elsif($poem[$b][$c] == 11) {
                                $scratch = int ( rand(@prosub)) + 0;
                                chomp($prosub[$scratch]);
                                $poem[$b][$c] = $prosub[$scratch];
                        } elsif($poem[$b][$c] == 12) {
                                $scratch = int ( rand(@proobj)) + 0;
                                chomp($proobj[$scratch]);
                                $poem[$b][$c] = $proobj[$scratch];
      			}  else {
				$scratch = int ( rand(@article)) + 0;
                                chomp($article[$scratch]);
				$poem[$b][$c] = $article[$scratch];
			}
		}
		srand (time ^ $$ ^ unpack "%L*", `ps axww | gzip`);
		print " ";
	}
	print "\n\n<BR><BR>";
	# give Jack a joint for his efforts
	open (FILE, 'kerouacs_reefer');
	$kerouacs_reefer = <FILE>;
	close (FILE);

	if (open (FILE, ">kerouacs_reefer")) {
	    $kerouacs_reefer++;
	    print FILE $kerouacs_reefer;
	    close (FILE);
#	    print "\n\n Poem #$kerouacs_reefer\n";
	} else { print "[ Can't write to the data file! Counter not incremented! ]\n";
}

}

# Ed Kloman makes sure you handle A and An the right way.

sub kloman {
	$b = 0;
	for($lines; $b < $lines; $b++) {
        	        $c = 0;
                	for($wordcount[$b]; $c < $wordcount[$b]; $c++){
				if($poem[$b][$c] eq "a") {

				@voweltest = split(//, $poem[$b][$c+1]);
				if($voweltest[0] eq "a" || $voweltest[0] eq "e" || $voweltest[0] eq "i" || $voweltest[0] eq "o" || $voweltest[0] eq "u" || $voweltest[0] eq "A" || $voweltest[0] eq "E" || $voweltest[0] eq "I" || $voweltest[0] eq "O" || $voweltest[0] eq "U") {
					$poem[$b][$c] = "an";
				}
				}
			}
	}
}

# Johan Gutenberg prints the poem out to the screen.

sub gutenberg {
	$b = 0;
	for($lines; $b < $lines; $b++) {
		$c = 0;
		for($wordcount[$b]; $c < $wordcount[$b]; $c++) {
			$elpoem[$b] = "$elpoem[$b] $poem[$b][$c]";
		}
		$elpoem[$b] = "$elpoem[$b]<BR>";
	}
}


pound();
ginsberg($lines, $words);
kerouac();
kloman();
gutenberg();

$f = 0;
for($lines; $f < $lines; $f++) {
	@theline = split(//, $elpoem[$f]);
	$linelength = @theline;
	$g = 0;
	for($linelength; $g < $linelength; $g++) {
		print $theline[$g];
		#select(undef,undef,undef,.035);
	}
#	print $elpoem[$f];
	$elpoem[$f] = "";
}

#sleep(5);
system("clear");
}
