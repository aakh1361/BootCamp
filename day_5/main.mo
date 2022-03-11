import Cycles "mo:base/ExperimentalCycles";
import Text      "mo:base/Text";
import Principal "mo:base/Principal";
import HashMap   "mo:base/HashMap";
import Nat       "mo:base/Nat";

actor {

  // 2
 var favoriteNumber = HashMap.HashMap<Principal,Nat> (0,Principal.equal,Principal.hash);

  // 1
  public shared(msg) func is_anonymous (): async Bool{
    
    if(Principal.isAnonymous(msg.caller))
        return true;
    
    return false;
    };
  
  // 3_1 
  public shared(msg) func add_favorite_number (n : Nat) {
    favoriteNumber.put(msg.caller,n);
  };
  
  // 3_2
  public shared(msg) func show_favorite_number () : async ?Nat{
   return favoriteNumber.get(msg.caller);
  };

  // 4
  public shared(msg) func add_favorite_number_2 (n : Nat) : async Text{

    for (a in favoriteNumber.keys())
    {
      if (Principal.equal(msg.caller,a))      
      {
         return "You've already registered your number";    
      }
    };

    favoriteNumber.put(msg.caller,n);
    return "You've successfully registered your number";
  };

  // 5_1
  public shared(msg) func update_favorite_number(n : Nat){
    var x = favoriteNumber.replace(msg.caller,n);    
  };

  // 5_2
  public shared(msg) func delete_favorite_number(){
    favoriteNumber.delete(msg.caller);   
  };  

  // 6 
  public shared(msg) func deposit_cycles () : async Nat{
    return Cycles.available();
    //return Cycles.balance();
  };

  // 7
  public func withdraw_cycles(n : Nat) : async Nat {

    return Cycles.accept(n);
    
  };


};
