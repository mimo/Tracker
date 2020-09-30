with raylib;

package Surface is

   type Actor is interface;
   procedure Setup  (ctxt : in out Actor) is abstract;
   procedure Update (ctxt : in out Actor ; dt : Float) is abstract;

   type Reference is access Actor'class;
   type Actor_Stack is array (Positive range <>) of Reference;

   type Instance is new Actor with record
      Tab  : Actor_Stack (1 .. 50);
   end record;
   procedure Setup  (ctxt : in out Instance) is null;
   procedure Update (ctxt : in out Instance ; dt : Float) is null;
end Surface;
