with Raylib;
with Surface.elements;
with tracker.datasource;

package body tracker.presentation is

   PURE_BLUE : constant := 16#0000FFFF#;
   PURE_RED : constant := 16#FF0000FF#;
   PURE_GREEN : constant := 16#00FF00FF#;
   WHITE  : constant := 16#FFFFFFFF#;
   BLUE : constant := 16#447FFFFF#;
   GOLD : constant := 16#FF8833FF#;
   CYAN : constant := 16#11AABBFF#;
   DARKGRAY : constant := 16#101A1AFF#;


   --  BG ; SHADE ; SHADOW ; TEXT ; LABEL
   Theme : array (element'range) of Raylib.Color;

   procedure setup (self : in out instance) is
   begin
      Background_Color (self, Theme(BG));
      Size (self, 800, 800);
      Title (self, "Tracker");

      tracker.datasource.Load;
   end setup;

   procedure update (self : in out instance ;  dt : Float) is
      use Surface.elements;
      I : Item;
      --book renames self.book_Completion;
   begin
      quad (100, 90, 250, 25);
      print (100, 90, Activities.Collections(1).name);

      raylib.shapes.draw_rectangle_lines_ex (
            rec        => (96.0, 121.0, 250.0+8.0, 25.0+8.0),
            line_thick => 2,
            c          => theme(HIGHLIGHT));
      for number in 1..Activities.Collections(1).Items_Count loop
         I := Activities.Collections(1).Items(number);
            raylib.shapes.draw_rectangle_rounded(
         rec       => (100.0,125.0 + float(number-1) *40.0,250.0,25.0),
         roundness => 0.2,
         segments  => 6,
         c         => Theme (SHADE));
         print (100, 125 + (number-1) * 40, I.name(1..I.name_length));
      end loop;

   end update;

   procedure Set_Color (E : Element ; C : Color_Value) is
   begin
      Theme (E) := raylib.colors.get_color(raylib.unsigned(C));
   end Set_Color;

begin

   Set_Color (BG,     BLUE);
   Set_Color (SHADE,  WHITE);
   Set_Color (HIGHLIGHT,  GOLD);
   Set_Color (SHADOW, DARKGRAY);
   Set_Color (TEXT,   DARKGRAY);
   Set_Color (LABEL,  DARKGRAY);

end tracker.presentation;
