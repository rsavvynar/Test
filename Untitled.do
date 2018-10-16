// Kelsey D. Meagher
// kdmeagher@ucdavis.edu
// CA Climate Scientists Survey 2018
// October 2018
// File: 03_ClimateSci_Analysis.do

/*
This .do file produces the regression analysis of the Climate Scientist Survey.
*/

clear all
capture log close
macro drop _all
set more off

********************************************************************************
// #0
// Set-up
********************************************************************************
cd "/Users/kelseymeagher/Google Drive/Climate Scientists Study/Analysis"

global folder "/Users/kelseymeagher/Google Drive/Climate Scientists Study/Analysis"
global data "${folder}/Data/CA_Climate_Scientists_20180906"
global graphs "${folder}/Graphs"

log using "${folder}/01_ClimateSci_Analysis.log", replace text

use "${data}_3", clear


********************************************************************************
// #1
// Recoding variables for analysis
********************************************************************************

// Gender
	gen male=1 if gender==1
	replace male=0 if gender==2 | gender==3
	label val male yesno
	
// Race
	gen race3=1 if race==1
	replace race3=2 if race==2
	replace race3=3 if race==5
	label define race3 1 "White" 2 "Hispanic" 3 "Asian/Pacific Islander"
	label val race3 race3

reg engagescale i.male	
