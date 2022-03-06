import Arr "mo:base/ExperimentalStableMemory";
import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Text "mo:base/Text";


actor {
    
  private var Number : Nat   = 0;
  private var sum    : Nat  = 0;
  private var tmpmax : Nat  = 0;
  private var tmp    : Nat  = 0;

  // 1
  public func add (a : Nat, b : Nat) : async Nat{
    return a+b;
  };
  
  // 2
  public func square(n: Nat) : async Nat{
    return n*n;
  };

  // 3
  public func days_to_second(n : Nat): async Nat{    
    return n*(24*60*60);
  };
  
  // 4_1
  public func increment_counter (n : Nat): async Nat{
    Number += n;
    return Number;
  };
  
  // 4_2
  public func clear_counter (){
    Number:=0;    
  };

  // 5
  public func divide (a : Nat, b : Nat) : async Bool{
    var c : Nat=0;
    c := a % b;
    
    if (c==0)
    {
      return true;
    }
    else
    {
      return false;
    };
  };

  // 6 
  public func is_even (n : Nat) : async Bool{
    if ((n % 2)!=0)
     {
      return false;
     }
    else
     {
      return true;
     }
  };
  // 7
   public func sum_of_array(Arr : [Nat]) : async Nat{
     
     sum :=0;
     
     if(Arr.size()==0)
       return 0;
      
      for(tmp in Arr.vals())
       {
         sum += tmp;
       };
       return sum;
   };
  
  // 8
  public func maximum (Arr : [Nat]) : async Nat{
     
       tmpmax := 0;
       if(Arr.size()==0) return 0;
       

       for(tmp in Arr.vals())
       {
         if (tmp > tmpmax)
         {
           tmpmax := tmp;
         };
       };
       
       return tmpmax;
  };
  
  // 9
   public func remove_from_array(Arr : [Nat], n : Nat): async [Nat] 
   {
     
     let NewArr : [var Nat] = Array.init<Nat>(Arr.size(), 0);
     //let  NewArr = Array.thaw<Nat>(Arr);

        var i = Arr.size();
        var x = 0;
        var v = 0;

        while (x < i) {
            if (Arr[x]!=n)
            {          
               NewArr[v] := Arr[x];
               v +=1;
            };
            x += 1;
        };                   
        return Array.freeze(NewArr);
    };

  public func selection_sort (Arr : [Nat]) : async [Nat]
  {
    let tmpArr = Array.thaw<Nat>(Arr);
    var a = Arr.size();
    var x=0;
    var y=0;
    var tmp = 0;
    
     while ( x < a)
     {
         while ( y < a)
         {           
           if (tmpArr[x] < tmpArr[y])
           {
             tmp := tmpArr[x];
             tmpArr[x] := tmpArr[y];
             tmpArr[y] := tmp;
           };
           y+=1;
         };
       x+=1;
       y:=x;
     };
    return Array.freeze(tmpArr);
  };
};
