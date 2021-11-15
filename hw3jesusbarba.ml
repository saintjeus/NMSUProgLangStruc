(* Jesus Barba
   CS471-HW3 *)

(* 1. Write a function reasonable_date that takes a date and determines if it
describes a real date in the common era. A real date has a positive year
(year 0 did not exist), a month between 1 and 12, and a day appropriate for
the month. Solutions should properly handle leap years. Leap years are years
that are either divisible by 400 or divisible by 4 but not divisible by 100.
(Do not worry about days possibly lost in the conversion to the Gregorian calendar
in the Late 1500s.) *)
let fEl(x,_,_) = x;;
let sEl(_,x,_) = x;;
let tEl(_,_,x) = x;;

let daycheck ((m:int), (d:int), (leap:bool)) =
  (* do the check for months with 31 days*)
  if ((m==1 || m==3 || m==5 || m==7||m==8||m==10||m==12)
      && ((d>=1)&&(d<=31))) then true
      (* do the check for months with 30 days*)
  else if ((m==4||m==6||m==9||m==11)&&((d>=1)&&(d<=31))) then true
      (*do the check for leap year February*)
  else if ((m==2)&& leap &&((d>=1)&&(d<=29))) then true
      (*do the check for nonleap year Feb*)
  else if ((m==2)&& not leap &&((d>=1)&&(d<=28))) then true
  else false;;

let leap y =
  if (y mod 100 == 0)&&(y mod 400 ==0) then true
  else if (y mod 4 == 0)&&(y mod 100 != 0) then true
  else false;;

let reasonable_date (date:int*int*int) =
  let l = leap(tEl(date)) in
  (*check month in range*)
  if (((fEl(date) >=1)&&(fEl(date)<=12))&&(tEl(date)>=0)&&daycheck(fEl(date),sEl(date), l))
  then true else false;;

reasonable_date(2,29,1900);; (* should return false*)
reasonable_date(2,29,2000);; (* should return true*)
reasonable_date(-1,1,1);; (* should return false*)
reasonable_date(12,31,2021);; (* should return true*)


  
(* 3. Write a function remove that removes the N'th element from a list.
The examples given for this assignment start with index 0. *) 
let rec remove n = function
  | [] -> []
  | hd::tl -> if n = 0 then tl else hd :: remove (n - 1) tl;;

remove 1 [1;2;3;4];; (* should return 1 3 4 in a list*)
  
(* 4. Write a function drop that drops every N'th element from a list.*)
let drop n l =
  let rec aux i = function
    | [] -> []
    | hd::tl -> if i = n then aux 1 tl else hd::aux(i+1) tl  in
  aux 1 l;;
drop 2 [1;2;3;4;5;6;7;8;9];; (*should return list with odd ints 1-9*)