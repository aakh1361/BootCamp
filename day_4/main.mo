import Text    "mo:base/Text";
import Nat     "mo:base/Nat";
import Nat8    "mo:base/Nat8";
import Animal  "./animal";
import List    "mo:base/List";

import ListNew "./list";


actor {
  type animal = Animal.animal;

  // 5
  public type List<T> = ?(T, List<T>);  
  var MyList : List<animal> =List.nil<animal>();


  var z : animal = {
      specie = "Tiger";
      energy = 45;
      };
  

  // 1
  public query func fun () : async animal {
    return z;
  };
  // 2 
  // function animal_sleep is in animal.mo

  // 3 
  public query func GetAnimal () : async animal {
    return Animal.animal_sleep(z);
  };
  
  // 4
  public func create_animal_then_takes_a_break (a : Text , n : Nat ) : async animal {    
    let x : animal = {
      specie = a;
      energy = n;
      };

    return Animal.animal_sleep(x);
  };

  // 6
  public func push_animal (a : animal) {
    MyList :=  List.push<animal>  (a,MyList);    
  };

  // 7
  public func  get_animals (): async [animal] {
    //return List.map(MyList, func (x : animal) :{if (x != Null) return x;else return 0;} );
    //return List.toVarArray<List>( MyList);
    return MyList.mapFilter<List,animal>(MyList
    ,
    func (x : animal) : animal
    {
      switch(x)
      {
        case (Null)
        {
          //return  

        };
        case (?dosomting)
        {
          return x;
        };
      };
    });
  };
};
