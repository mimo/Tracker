with Ada.Strings.Fixed;

package body tracker is

   procedure Percentage (Object : in out Collection) is
   begin
     for I in Fixed_Collection'First .. Fixed_Collection'First + Object.Items_Count - 1 loop
        Object.Counter (Object.Items(I).state) := Object.Counter(Object.Items(I).state) + 1;
     end loop;
   end Percentage;

   procedure Set_Name (Object : in out Collection; Name : String) is
   begin
      Ada.Strings.Fixed.Move (Name, Object.Name);
   end Set_Name;

   procedure Add_Item (Object : in out Collection ; Name : String ; S : Item_Status := UNSTARTED) is
      New_Item : Item;
   begin
      New_Item.state := S;
      Ada.Strings.Fixed.Move (Name, New_Item.name);
      New_Item.name_length := Integer'Min  (Name'Length, New_Item.name'Length);

      Object.Items (Object.Items'First + Object.Items_Count) := New_Item;
      Object.Items_Count := Object.Items_Count + 1;
   end Add_Item;

   procedure Move_Up   (Object : in out Collection ; Item : Integer) is
   begin
      null;
   end Move_Up;

   procedure Move_Down (Object : in out Collection ; Item : Integer) is
   begin
      null;
   end Move_Down;

   procedure Add_Collection (Object : in out Board; Col : Collection) is
   begin
      Object.Collections (Object.Collections'First + Object.Collection_Count) := Col;
      Object.Collection_Count := Object.Collection_Count + 1;
   end Add_Collection;

end tracker;
