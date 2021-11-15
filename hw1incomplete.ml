(* This is an OCaml editor.
   Enter your program here and send it to the toplevel using the "Eval code"
   button. *)

let fEl (x, _, _) = x;;
let sEl (_, x, _) = x;;
let tEl (_, _, x) = x;;

(* 1. Write a function number_in_months that
takes a  list  of  dates  and  a  list  of  months
(i.e., an int list) and returns the number of dates
in the list of dates that are in any of the months in
the list of months. Assume the list of months has no
number repeated. You can use the function number_in_month
that we wrote in class.*)

let dates = [(9,8,21); (9,21,21); (10,31,21)];;
let months = [8; 8];;

let rec number_in_months( (dates: (int*int*int) list), (month:int)) =
  if dates = [] then 0 
  else let num = dates_in_month(List.tl(dates), month) in
    if (fEl(List.hd(dates)))=month
    then num = num+1
    else num;;

(* 2. Write a function get_nththat takes a list of strings and
a positive int n and returns the nth element of the list where
the head of the list is 1st. Do not worry about the case where
the list has too few elements: your function may apply List.hd
or List.tl to the empty list in this case, which is okay.
Remember to use recursion in your solution.
*)
let rec get_nth( (strList: string list), (n:int)) =
  if n=1 then List.hd(strList)
  else get_nth(List.tl(strList), n-1);;

(* 3. Write a function number_before_reaching_sum that
takes an int called sum, which you  can  assume  is  positive,
and  an  int  list,  which  you  can  assume  contains  all
positive numbers, and returns an int. You should return an int n
such that the first n elements of the list add to less than sum,
but the first n + 1 elements of the list add to sum or more.
Assume the entire list sums to more than the passed in value;
it is okay for an exception to occur if this is not the case. *)
let rec number_before_reaching_sum( (sum:int), (intList:int list)) =
  if sum <= List.hd(intList) then 0
  else 1+number_before_reaching_sum(sum-List.hd(intList), List.tl(intList));;
