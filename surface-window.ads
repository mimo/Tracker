with Raylib;

package Surface.Window is

   type Instance is abstract new Actor with private;
   procedure Attach (Application : in out Reference);
   procedure Run (Self : in out Instance'Class);
   procedure Title (Self : in out Instance ; Title : String);
   procedure Background_Color (Self : in out Instance ; Tint : raylib.Color);
   procedure Size (Self : in out Instance ; Width, Height : Integer);
   procedure Setup  (self : in out Instance);
   procedure Update (self : in out Instance ; dt : Float) is null;
private

   type instance is new Actor with record
      Window_Title  : String (1..42);
      Window_Width  : Integer;
      Window_Height : Integer;
      Border_Width  : integer;
      Border_Color  : raylib.Color;
      Background_Color : Raylib.Color;
   end record;
   
end Surface.Window;
