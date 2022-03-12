import Hash  "mo:base/Hash";
import HashMap "mo:base/HashMap";
import Nat   "mo:base/Nat";
import Nat8  "mo:base/Bool";
import Principal "mo:base/Principal";
import Text  "mo:base/Text";
import List  "mo:base/List";
import Array "mo:base/Array";
import Blob  "mo:base/Blob";
import HTTP  "./HTTP";


actor Test {

  type List<T> = ?(T, List<T>);



  // 1
  type TokenIndex = Nat;
  type Result<Ok, Err> = {#ok : Ok; #err : Err};

  var nextTokenIndex : Nat = 0;
  
  type Error = {
     #Ok;
     #Good;
     #Bad;
  };

  // 2
  var registry = HashMap.HashMap<TokenIndex,Principal>(0,Nat.equal,Hash.hash);
  
  // 3 
  public shared(msg) func mint () : async Text {
    
    if (Principal.isAnonymous(msg.caller))
    {
      return "you have not allow";
    };
    
    registry.put(nextTokenIndex,msg.caller);
    nextTokenIndex+=1;

    return "Now You Have a Nft Register" # Nat.toText(nextTokenIndex-1);
  };


  // 4
  public shared(msg) func transfer (to : Principal,tokenIndex : Nat) : async Text
  {
    var p : ?Principal = registry.get(tokenIndex);
    switch (p)
    {
      case (null)
       {
         return "Not Find This NFT";
       };
      case (?dosomething)
       {
        if(Principal.equal(dosomething,msg.caller))
         {
           registry.delete(tokenIndex);
           registry.put(tokenIndex,to);
         }
         else
         {
           return "You Not Allow";
         };
       };
    };
    return "NFT Number : "# Nat.toText(tokenIndex) #" Susseful Transfer to : " # Principal.toText(to);
  };

 // 5
 public shared(msg) func  balance () : async List<Nat> {
   var Arr : [var Nat] = Array.init<Nat>(registry.size(),0);
   var n = 0;  

   for ((a,b) in registry.entries())
   {
     if (Principal.equal(msg.caller,b))     
     {
       Arr[n] := a;
       n+=1;
     };
   };
   return List.fromVarArray<Nat>(Arr);
  };

 // 6
 public shared(msg) func http_request (h : HTTP.Request) : async HTTP.Response
  {    
    return {
        body               = Text.encodeUtf8(mint());
        headers            = [("Content-Type", "text/html; charset=UTF-8")];
        status_code        = 200 : Nat16;
        streaming_strategy = null;
    };
  };

  // 7  
  // ??????????????????????????
  // ??????????????????????????


};
