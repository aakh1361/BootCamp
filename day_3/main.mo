import Arr "mo:base/ExperimentalStableMemory";
import Array "mo:base/Array";
import Int "mo:base/Nat16";
import Int64 "mo:base/Int64";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Nat8 "mo:⛔";
import Text "mo:base/Text";

actor {

 // 1
 private func swap(Arr : [var Nat], i : Nat, j : Nat) : async [Nat] {   
   
   var t =  Arr[i];
   var s = Arr.size();
   if(i!=j)
   {
     Arr[i] := Arr[j];
     Arr[j] := t;
   };
  return Array.freeze(Arr);
};

// 2
public func init_count(n : Nat):async [Nat] {
  var Arr = Array.init<Nat>(n,0);
  if (n==0 or n==1) return [0];
  for (a in Iter.range(0,n-1))
  {
    Arr[a]:=a;
  };
  return Array.freeze(Arr);
 };

// 3
public func seven(n : [Nat]) : async Text {
     for (a in n.vals())
     {
      if (a==7) return "Seven is found";
     };
      return "Seven not found";
  };

// 4
public func nat_opt_to_nat (n : ?Nat, m : Nat): async Text {    
    switch (n)    
    {
      case(null)  {
         return "n is  " #  Nat.toText(m);
      };

      case(?something)
      {
         return "n is  " #  Nat.toText(something);
      };
    };
  };

// 5
public func day_of_the_week  (n : Nat) : async Text{
  
  switch (n) {
    case (1) {
      return "Monday";
    };
    case (2){
      return "Tuesday";
    };
    case (3){
      return "Wednesday";
    };
    case (4){
      return "Thursday";
    };
    case (5){
      return "Friday";
    };
    case (6){
      return "Saturday";
    };
    case (7)
    {
      return "Sunday";
    };
    case (something)
    {
      return "null";
    };    
   };
  };

 // 6
 public func populate_array (Arr : [?Nat] ) : async [Nat] {
   
   return Array.map<?Nat,Nat> ( Arr,func (n : ?Nat) : Nat {
     switch(n){
       case (null) {return 0;};
       case (?dosomething) {return dosomething;};
     };
    });
 };

 // 7 
 public func sum_of_array (Arr : [Nat]) : async Nat{   
   return Array.foldLeft<Nat,Nat>(Arr,0, 
   func(x : Nat, z : Nat)
   {
     z+x;
   }
   );
 };

 // 8
 //public func 
 public func squared_array (Arr : [Nat]) :async [Nat] {
   return Array.map<Nat,Nat>(Arr,
   func(n : Nat) {
     n*n;
   }
   );
 };

// 9
 public func increase_by_index (Arr : [Nat]) : async [Nat]{
  var x : Int64 = -1;
  return Array.map<Nat,Nat>(Arr,
    func(n : Nat)
     {
       x+=1;
      return Nat8.nat64ToNat(Nat8.int64ToNat64(x)+Nat8.natToNat64(n));
     }
   );
 };

 // 10
 //public func contains<A> (Arr : [A], n : A, (A,A) ) : async Bool{
  
  //return true;
 //};
};