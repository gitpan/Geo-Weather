# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'
######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..2\n"; }
END {print "not ok 1\n" unless $loaded;}
use Geo::Weather;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

$weather = new Geo::Weather;
$weather->{timeout} = 3;

print "Enter US zipcode of location you are at: ";
my $zip = <STDIN>;
chomp($zip);
print "Attempting to connect to weather.com...\n\n";

my $condition = $weather->get_weather($zip);

if (ref $condition) {
	print "Current Conditions for $condition->{city}, $condition->{state}:\n\n";
	print " Condition: $condition->{cond}\n";
	print " Condition Image: $condition->{pic}\n";
	print " Temp: $condition->{temp} F\n";
	print " Wind: $condition->{wind}\n";
	print " Head Index: $condition->{heat} F\n";
	print " Visability: $condition->{visb}\n";
	print " Barometer: $condition->{baro}\n\n";
	print "If the above results are correct, your Geo::Weather installation is functioning normally\n";
	print "ok 2\n";
} else {
	print "Error: $condition\n";
	print "not ok 2\n";
}
