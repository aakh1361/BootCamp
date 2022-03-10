import Nat  "mo:base/Nat";
import Text "mo:base/Text";
import List "mo:base/List";


module {
public type animal = {    
    specie  : Text;
    energy  : Nat;
};

// 2
public func animal_sleep (a : animal) : animal{ 

    var b :animal = {
        energy = a.energy+10;
        specie = a.specie;
        };    

 return b;
};
}