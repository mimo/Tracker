with Surface.Window;

package tracker.presentation is

   type instance is new Surface.Window.Instance with record
      Book_Completion : Collection;
   end record;
   overriding procedure Setup  (self : in out instance);
   overriding procedure Update (self : in out instance ;  dt : Float);

   type Element is (BG, SHADE, HIGHLIGHT, SHADOW, TEXT, LABEL);
   type Color_Value is mod 2**32;
   procedure Set_Color (E : Element ; C : Color_Value);

end tracker.presentation;
