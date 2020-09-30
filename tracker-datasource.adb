with Input_Sources.File; use Input_Sources.File;
with Sax.Readers;        use Sax.Readers;
with DOM.Readers;        use DOM.Readers;
with DOM.Core;           use DOM.Core;
with DOM.Core.Documents; use DOM.Core.Documents;
with DOM.Core.Nodes;     use DOM.Core.Nodes;
with DOM.Core.Attrs;     use DOM.Core.Attrs;
with Ada.Text_IO;        use Ada.Text_IO;

package body tracker.datasource is

   procedure Load is
      Input  : File_Input;
      Reader : Tree_Reader;
      Doc    : Document;
      Activities_List   : Node_List;
      Activity_Node      : Node;
      Focus_Attrib      : Attr;
      Current_Child : Node;

   begin
      Set_Public_Id (Input, "Activities file");
      Open ("activities.xml", Input);

      Set_Feature (Reader, Validation_Feature, False);
      Set_Feature (Reader, Namespace_Feature, False);

      Parse (Reader, Input);
      Close (Input);

      Doc := Get_Tree (Reader);

      Activities_List := Get_Elements_By_Tag_Name (Doc, "activity");

      for Index in 1 .. Length (Activities_List) loop
         READING_COL : declare
            Col : Collection;
         begin
            Activity_Node := DOM.Core.Nodes.Item (Activities_List, Index - 1);
            Focus_Attrib := Get_Named_Item (Attributes (Activity_Node), "focus");

            if Focus_Attrib = null then
               Col.Focused := False;
            else
               Col.Focused := Boolean'Value (Value (Focus_Attrib));
            end if;

            Current_Child := First_Child (Activity_Node);

            loop
               exit when Current_Child = null;
               if Node_Type (Current_Child) = Element_Node then
                  if Node_Name (Current_Child) = "name" then
                     Set_Name (Col, Node_Value (First_Child (Current_Child)));
                  else
                     Add_Item (
                        Col,
                        Node_Value (First_Child (Current_Child)),
                        Item_Status'Value (
                           Value (
                              Get_Named_Item (Attributes(Current_Child),
                                                         "state"))));
                  end if;
               end if;
               Current_Child := Next_Sibling (Current_Child);
            end loop;
            Add_Collection (Activities, Col);
         end READING_COL;
      end loop;

      Free (Activities_List);
      Free (Reader);
   end Load;

end tracker.datasource;
