with Ada.Strings.Fixed;

package body Surface.Window is

   procedure Attach (Application : in out Reference) is
   begin
      null;
   end Attach;

   procedure Setup (self : in out Instance) is
   begin
      Background_Color (self, raylib.LIGHTGRAY);
      Size (self, 1027, 768);
      Title (self, "Unnamed");
   end Setup;

   procedure Run (Self : in out Instance'Class) is
      delta_time : Float := 0.0;
      Windows_Area  : raylib.Rectangle;
      use type raylib.int;
   begin
      Windows_Area := (0.0,0.0,float(self.window_Width),float(self.window_Height));

      Instance(Self).Setup;
      self.Setup;

      Raylib.Window.Init (self.window_Width, self.window_Height, self.window_title);

      while not raylib.window.should_close loop
         raylib.begin_drawing;
         raylib.clear_background (self.Background_Color);

         self.Update (delta_time);

         if self.Border_Width > 0 then
            raylib.shapes.draw_rectangle_lines_ex (Windows_Area,
                                             raylib.int(self.Border_Width),
                                             self.Border_Color);
         end if;
         raylib.end_drawing;
      end loop;

      raylib.window.close;
   end run;

   procedure Title (Self : in out Instance ; Title : String) is
   begin
      Ada.Strings.Fixed.Move (Title, Self.Window_Title);
   end Title;

   procedure Background_Color (Self : in out instance ; Tint : raylib.Color) is
   begin
      Self.Background_Color := Tint;
   end Background_Color;

   procedure Size (Self : in out Instance ; Width, Height : Integer) is
   begin
      Self.Window_Width  := Width;
      Self.Window_Height := Height;
   end Size;

end Surface.Window;
