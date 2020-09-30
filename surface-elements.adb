package body surface.elements is

   procedure quad (X,Y, Width, Height : Integer ; Border : Boolean := False) is
      use raylib;
   begin
      raylib.shapes.draw_rectangle (
         posX   => int(X),
         posY   => int(Y),
         width  => int(Width),
         height => int(Height),
         c      => raylib.LIGHTGRAY);
      if Border then
         raylib.shapes.draw_rectangle_lines_ex (
            rec        => (float(X), float(Y), float(Width), float(Height)),
            line_thick => 2,
            c          => GOLD);
      end if;
   end quad;
   
   procedure print (X,Y : Integer; Text : String; Size : Integer := 16) is
   begin
      raylib.text.draw_ex (
               raylib.text.get_font_default,
               text,
               (Float(X), Float(Y)),
               Float(Size),
               1.0,
               raylib.BLACK);
   end print;

end surface.elements;
