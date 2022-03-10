import List "mo:base/List";

module {

    public type List<T> = ?(T, List<T>);  

    public func is_null<T>(l : List<T>) : async Bool {
        switch(l){
            case(?dosomting){
                return false;
            };
            case (Null){
                return true;
            };
        };
    };

    public func last<T>(l : List<T>) : async T {
        var tmp = T;

        for (a in l.vals())
        {
            tmp:=a;
        };
        return tmp;
    };

  public func size<T> (l : List<T>) : async Nat {
        var tmp = 0;

        for (a in l.vals())
        {
            tmp+=1;
        };
        return tmp;
    };

};