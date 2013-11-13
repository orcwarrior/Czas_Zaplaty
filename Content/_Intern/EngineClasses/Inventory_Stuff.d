/*
oCInformationManager.dlgTrade ->
oCViewDialogInventory.oCViewInventory ->
oCViewInventory.oCNpcInventory

*/

class oCNpcInventory {
//      oCStealContainer inventory2 {
            var int    inventory2_vfptr;                           // 0x0000 
            var int    inventory2_contents;                        // 0x0004 zCListSort<oCItem>*
            var int    inventory2_npc;                             // 0x0008 oCNpc*
            var int    inventory2_selectedItem;                    // 0x000C int
            var int    inventory2_offset;                          // 0x0010 int
            var int    inventory2_drawItemMax;                     // 0x0014 int
            var int    inventory2_itemListMode;                    // 0x0018 oTItemListMode
            var int    inventory2_frame;                           // 0x001C zBOOL
            var int    inventory2_right;                           // 0x0020 zBOOL
            var int    inventory2_ownList;                         // 0x0024 zBOOL
            var int    inventory2_prepared;                        // 0x0028 zBOOL
            var int    inventory2_passive;                         // 0x002C zBOOL
            var int    inventory2_viewCat;                         // 0x0030 zCView*
            var int    inventory2_viewItem;                        // 0x0034 zCView*
            var int    inventory2_viewItemActive;                  // 0x0038 zCView*
            var int    inventory2_viewItemHightlighted;            // 0x003C zCView*
            var int    inventory2_viewItemActiveHighlighted;       // 0x0040 zCView*
            var int    inventory2_viewItemFocus;                   // 0x0044 zCView*
            var int    inventory2_viewItemActiveFocus;             // 0x0048 zCView*
            var int    inventory2_viewItemHightlightedFocus;       // 0x004C zCView*
            var int    inventory2_viewItemActiveHighlightedFocus;  // 0x0050 zCView*
            var int    inventory2_viewItemInfo;                    // 0x0054 zCView*
            var int    inventory2_viewItemInfoItem;                // 0x0058 zCView*
            var int    inventory2_textView;                        // 0x005C zCView*
            var int    inventory2_viewArrowAtTop;                  // 0x0060 zCView*
            var int    inventory2_viewArrowAtBottom;               // 0x0064 zCView*
                                                                        
            var int    something_ptr;                              // 0x0068 vtbl: 8241236             
            var int    unknw1;                             		   // 0x006C val: 0         
            var int    unknw2;                             		   // 0x0070 val: 0         
            var string Title;                             		   // 0x0074 val: "Cavalorn"      
            var int    unknw3;                             		   // 0x0088 val: 1         
            var int    unknw4;                             		   // 0x008C val: 1         
            var int    unknw5;                             		   // 0x0090 zColor?         
            var int    unknw6;                             		   // 0x0094 zColor?         
            var int    owner;                             		   // 0x0098 *zCNPC        
              
};
