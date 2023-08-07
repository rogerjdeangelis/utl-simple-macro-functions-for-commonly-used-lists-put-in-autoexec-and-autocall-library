%let pgm=utl-simple-macro-functions-for-commonly-used-lists-put-in-autoexec-and-autocall-library;

Simple macro functions for commonly used lists put in autoexec and autocall library

Solution
    1. WPS macro
    2. WPS autoexec

github
https://tinyurl.com/34ractem
https://github.com/rogerjdeangelis/utl-simple-macro-functions-for-commonly-used-lists-put-in-autoexec-and-autocall-library

/**************************************************************************************************************************/
/*                                                                                                                        */
/* USEFULL LIST MACRO IOTA                                                                                                */
/* =======================                                                                                                */
/*                                                                                                                        */
/* Suppose you want various numeric maco strings                                                                          */
/*                                                                                                                        */
/* %let lst=%iota(10);                                   Yeilds %put &=lst; LST=1 2 3 4 5 6 7 8 9 10                      */
/*                                                                                                                        */
/* %let lst=%iota(10,from=2,by=2);                       Yeilds %put &=lst; LST=2 4 6 8 10                                */
/*                                                                                                                        */
/* %let lst=%iota(10,from=2,by=2,delim=%str(,));         Yeilds %put &=lst; LST=2,4,6,8,10                                */
/*                                                                                                                        */
/*                                                                                                                        */
/* AUTOEXEC LISTS                                                                                                         */
/* ==============                                                                                                         */
/*                                                                                                                        */
/* Some lists you might want to include in your autoexec                                                                  */
/*                                                                                                                        */
/* %let lettersq=                                                                                                         */
/*  "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z";              */
/*                                                                                                                        */
/* %let letters=A B C D E F G H I J K L M N O P Q R S T U V W X Y Z;                                                      */
/*                                                                                                                        */
/*                                                                                                                        */
/* %let months = JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC;                                                         */
/*                                                                                                                        */
/* %let monthsq="JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT", "NOV", "DEC" ;                               */
/*                                                                                                                        */
/*                                                                                                                        */
/* %let states50= %sysfunc(compbl(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT           */
/* NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)) ;                                            */
/*                                                                                                                        */
/* %let statesq=%qsysfunc(compress(%str("AL","AK","AZ","AR","CA","CO","CT","DE","FL"                                      */
/*  ,"GA","HI","ID","IL","IN","IA","KS","KY","LA","ME"                                                                    */
/* ,"MD","MA","MI","MN","MS","MO","MT",                                                                                   */
/*  "NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD"                                            */
/* ,"TN","TX","UT","VT","VA","WA","WV","WI","WY")));                                                                      */
/*                                                                                                                        */
/*                                                                                                                        */
/* %let months = JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC;                                                         */
/* %let monthsq="JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT", "NOV", "DEC" ;                               */
/*                                                                                                                        */
/*                                                                                                                        */
/**************************************************************************************************************************/

%inc "c:/oto/sas_perpac.sas";

/*       _
(_) ___ | |_ __ _   _ __ ___   __ _  ___ _ __ ___
| |/ _ \| __/ _` | | `_ ` _ \ / _` |/ __| `__/ _ \
| | (_) | || (_| | | | | | | | (_| | (__| | | (_) |
|_|\___/ \__\__,_| |_| |_| |_|\__,_|\___|_|  \___/

*/

%utl_wpsbegin;
parmcards4;
%macro iota(too,from=1,by=1,delim=)/des="create a delimited list of numbers";

  %local idx res;

  %do idx=&from %to &too %by &by;

   %if &idx ^= &too %then %do;
        %let res=&res &idx &delim;
   %end;
   %else %do;
       %let res=&res &idx;
   %end;

  %end;

   %if &delim = %then %do;
      %sysfunc(compbl(&res))
   %end;
   %else %do;
       %sysfunc(compress(&res))
   %end;

%mend iota;

%put %iota(10);
;;;;
%utl_wpsend;

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
