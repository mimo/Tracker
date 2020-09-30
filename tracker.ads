
package tracker is

   type Item_Status is (UNSTARTED, PAUSE, PROGRESS, DONE, CANCELED);

   type Item is record
      name  : String (1 .. 42);
      name_length : Natural;
      state : Item_Status;
   end record;

   type Fixed_Collection is array (1 .. 50) of Item;
   type Items_Count_By_State is array (Item_Status'Range) of Natural;

   type Collection is record
      Name : String (1 .. 42);
      Items : Fixed_Collection;
      Items_Count : Integer := 0;
      Counter : Items_Count_By_State;
      Focused : Boolean := False;
   end record;

   procedure Set_Name (Object : in out Collection; Name : String);
   procedure Add_Item (
      Object : in out Collection;
      Name : String;
      S : Item_Status := UNSTARTED);
   procedure Percentage (Object : in out Collection);
   procedure Move_Up   (Object : in out Collection; Item : Integer);
   procedure Move_Down (Object : in out Collection; Item : Integer);

   type Fixed_Board is array (1 .. 12) of Collection;

   type Board is record
      Collections : Fixed_Board;
      Collection_Count : Integer := 0;
   end record;
   procedure Add_Collection (Object : in out Board; Col : Collection);

   Activities :  Board;

end tracker;
