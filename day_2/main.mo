import Array "mo:base/Array";
import Blob "mo:base/Blob";
import Char "mo:⛔";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Nat32 "mo:base/Bool";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";

actor {
  // 1 
  public func nat_to_nat8 (n : Nat) : async Nat8{
    return Nat8.fromNat(n % 256);
  };

 // 2
 public func max_number_with_n_bits (n : Nat): async Nat{
   return 2**n;
 };

// 3
 public func decimal_to_bits (n : Nat): async Text {
   var number = n;   
   var remainder : Text = "";
    while (number > 0)
            {                
                if ((number % 2)==0)
                {
                   remainder := Text.concat("0",remainder);
                }
                else
                {
                   remainder := Text.concat("1",remainder);
                };           
                number := number / 2;                      
            };
     return remainder;
   };
   
   // 4
   public func capitalize_character (c :Char): async Char{
       return Char.charToUpper(c);
       };

    // 5
    public func capitalize_text (t : Text): async Text{      
      var out : Text = "";    

      for (a in t.chars())
      {
        out := Text.concat(out,Text.fromChar(Char.charToUpper(a)));
      };
      return out;
    };

    // 6
    public func is_inside (t : Text , c : Char) : async Bool {
      for (ch in t.chars())
      {
        if (ch == c) return true;
      };
      return false;
    };
    
    // 7
    public func trim_whitespace (t : Text) : async Text{

      var out : Text = "";

      for (ch in t.chars())
      {
        if (ch !=' ')
          out := Text.concat(out,Char.charToText(ch));
      };
      return out;
    };

    // 8
    public func duplicated_character(t : Text, c : Char) : async Text
    {

      for (ch in t.chars())
      {
            if (ch==c)
                     return Char.charToText(c);
      };
      return t;
    };
    
    // 9
    public func size_in_bytes (t : Text): async Nat {
    var A= Blob.toArray(Text.encodeUtf8(t));      
    return A.size();
    };

    // 10
    public func bubble_sort (Arr : [Nat]) : async [Nat] {
    let tmpArr = Array.thaw<Nat>(Arr);
    var a = Arr.size();
    var x=0;
    var y=0;
    var tmp = 0;    
    a-=1;
     while (x < a)
     {     
         y:=0;
         while ( y < a)
         {
           if (tmpArr[y+1] < tmpArr[y])
           {
             tmp := tmpArr[y];
             tmpArr[y] := tmpArr[y+1];
             tmpArr[y+1] := tmp;
           };
           y+=1;
         };          
       x+=1;         
     };
    return Array.freeze(tmpArr);
  };

};