#!/usr/bin/perl
###################
#read file handling

$file_name="red_pixel.txt";
open(READ,"<",$file_name) || die "couldn't open $file_name";
@lines=<READ>; #moving the contents of the file to an array
close(READ) || die "couldn't close $file_name";
chomp(@lines);
###################
#write file handling
$file_name="hex.txt";
open(WRITE,">",$file_name) || die "couldn't open $file_name";
###################
LOOP : foreach $line (@lines){
 printf WRITE ("%.2x \n",$line);
}

close(WRITE);
open(WRITE,"<",$file_name); 
@lines=<WRITE>;
chomp(@lines);
close(WRITE);

 #write file handling
$file_name="red_hex.txt";
open(WRITE_final,">",$file_name) || die "couldn't open $file_name";

LOOP2 : foreach $line (@lines){
  printf WRITE_final substr $line,-3;
  printf WRITE_final "\n";
}

close(WRITE_final);

###############################################################
###################
#read file handling

$file_name="blue_pixel.txt";
open(READ,"<",$file_name) || die "couldn't open $file_name";
@lines=<READ>; #moving the contents of the file to an array
close(READ) || die "couldn't close $file_name";
chomp(@lines);
###################
#write file handling
$file_name="hex.txt";
open(WRITE,">",$file_name) || die "couldn't open $file_name";
###################
LOOP : foreach $line (@lines){
 printf WRITE ("%.2x \n",$line);
}

close(WRITE);
open(WRITE,"<",$file_name); 
@lines=<WRITE>;
chomp(@lines);
close(WRITE);

 #write file handling
$file_name="blue_hex.txt";
open(WRITE_final,">",$file_name) || die "couldn't open $file_name";

LOOP2 : foreach $line (@lines){
  printf WRITE_final substr $line,-3;
  printf WRITE_final "\n";
}

close(WRITE_final);


###############################################################
###################
#read file handling

$file_name="green_pixel.txt";
open(READ,"<",$file_name) || die "couldn't open $file_name";
@lines=<READ>; #moving the contents of the file to an array
close(READ) || die "couldn't close $file_name";
chomp(@lines);
###################
#write file handling
$file_name="hex.txt";
open(WRITE,">",$file_name) || die "couldn't open $file_name";
###################
LOOP : foreach $line (@lines){
 printf WRITE ("%.2x \n",$line);
}

close(WRITE);
open(WRITE,"<",$file_name); 
@lines=<WRITE>;
chomp(@lines);
close(WRITE);

 #write file handling
$file_name="green_hex.txt";
open(WRITE_final,">",$file_name) || die "couldn't open $file_name";

LOOP2 : foreach $line (@lines){
  printf WRITE_final substr $line,-3;
  printf WRITE_final "\n";
}

close(WRITE_final);



