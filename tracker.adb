with Ada.Strings.Fixed;
with raylib.UI;

procedure tracker is

   type views is (collections, stats);
   view : views := collections;
   procedure switch_view is
   begin
      view := (if view = views'Last
               then views'First
               else views'Succ (view));
   end switch_view;

   type collection is
   record
      name : String (1 .. 40);
   end record;

   type board_size is new Natural range 0 .. 12;
   type collection_list is array (1 .. board_size'Last) of collection;
   type board_type is
   record
      elements : collection_list;
      size : board_size := 0;
   end record;
   board : board_type;

   height : Float := 0.0;
begin
   raylib.window.init (500, 500, "tracker");

   while not raylib.window.should_close loop
      if raylib.core.is_key_pressed (raylib.KEY_TAB) then
         switch_view;
      end if;

      raylib.begin_drawing;
      raylib.clear_background (raylib.RAYWHITE);

      case view is
      when collections =>
         raylib.UI.statusbar ((0.0, 0.0, 500.0, 32.0), "Collections");
         if raylib.UI.button ((10.0, 40.0, 80.0, 24.0), "Ajouter")
            and then board.size < board_size'Last
         then
            board.size := board.size + 1;
            Ada.Strings.Fixed.Move (
               "COLLECTION" & board.size'Img,
               board.elements (board.size).name);
         end if;

         for I in 1 .. board.size loop
            height := 32.0  + 16.0 + 24.0 + Float (I - 1) * 30.0;
            raylib.UI.statusbar (
               bounds => (10.0, height, 200.0, 25.0),
               text => board.elements (I).name);
         end loop;
      when stats =>
         raylib.UI.statusbar ((0.0, 0.0, 500.0, 32.0), "Stats");
      end case;
      raylib.end_drawing;
   end loop;

   raylib.window.close;
end tracker;
