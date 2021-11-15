(* Jesus Barba
   CS474 - HW 2 *)

let months = [31, 59, 90, 120, 151, 181, 212, 243,273,304,334,365];;
(* 1. Write a function month_range that takes two days of the year day1 and day2
and returns an int list [m1;m2;...;mn] where m1 is the month of day1, m2 is the
month of day1+1, . . . , and mn is the month of day day2. Note the result will
have length day2 - day1 + 1 or length 0 if day1 > day2.*)

(* 2. Write a function oldest that takes a list of dates and evaluates to an
(int*int*int) option. It evaluates to None if the list has no dates else Some d
where the dated is the oldest date in the list.*)
let fEl (x, _, _) = x;;
let sEl (_, x, _) = x;;
let tEl (_, _, x) = x;;

let older (d1, d2) =
  if tEl(d1) < tEl(d2) then d1
  else if fEl(d1) > fEl(d2) then d1
  else if sEl(d1) > sEl(d2) then d1
  else d2;;

(* 3. Write a function cumulative_sum that takes a list of numbers and returns a
list of the  partial  sums  of  these  numbers.  For  example,  cumulative_sum
[12;27;13]  =  [12;39;52]. Hint: Use a helper function that takes two arguments*)
let rec csum(l, i) =
  match l with
  | [x] -> [List.hd(l) + i]
  | _ -> List.hd(l) + i :: csum(List.tl(l), List.hd(l)+i);;


let cumulative_sum(l:int list)=
  csum(l,0);;

cumulative_sum( [1;2;3] );;