#tag Window
Begin Window Window_BEAM_Options_APPLICAT_Scrapers
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   403
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Edit APPLICATOR"
   Visible         =   True
   Width           =   590
   Begin PushButton PushButton_Close
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Close"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   245
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   363
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Listbox Listbox_Scrapers
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   True
      ColumnWidths    =   "300"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   3
      GridLinesVertical=   3
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   337
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   True
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   16.0
      TextUnit        =   0
      Top             =   14
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   550
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Dim i as Integer
		  
		  donothing=True
		  
		  
		  App=Window_BEAM_Options_APPLICAT.APP
		  
		  
		  
		  
		  Refresh_window
		  donothing=False
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Refresh_window()
		  //----------------------------
		  //
		  //
		  //----------------------------
		  Dim i as Integer
		  Dim temp as String
		  //----------------------------
		  
		  Listbox_Scrapers.DeleteAllRows
		  Listbox_Scrapers.ColumnCount=app.N_APPLICAT+1
		  
		  Listbox_Scrapers.Heading(0)="Scraper"
		  temp="300"
		  for i=1 to app.N_APPLICAT
		    temp=temp+", 150"
		    Listbox_Scrapers.Heading(i)=Str(i)
		  next
		  Listbox_Scrapers.ColumnWidths=temp
		  
		  if app.Ishape=0 Then
		    Listbox_Scrapers.AddRow "Z of front face of scraper (cm)"
		    Listbox_Scrapers.AddRow "Thickness of scraper (cm)"
		    Listbox_Scrapers.AddRow "Halfwidth of inner opening in x, y (cm)"
		    Listbox_Scrapers.AddRow "Width of scraper bar in x, y (cm)"
		    Listbox_Scrapers.AddRow "Dose scoring zone"
		    Listbox_Scrapers.AddRow "Associate with LATCH bit"
		    Listbox_Scrapers.AddRow "Material"
		    for i=1 to app.N_APPLICAT
		      Listbox_Scrapers.ColumnType(i)=3
		      Listbox_Scrapers.Cell(0,i)=Format(app.ZMIN_APPLICAT(i-1),"-#.###")
		      Listbox_Scrapers.Cell(1,i)=Format(app.ZTHICK_APPLICAT(i-1),"-#.###")
		      Listbox_Scrapers.Cell(2,i)=Format(app.XMIN_APPLICAT(i-1),"-#.###")
		      Listbox_Scrapers.Cell(3,i)=Format(app.WIDTHX_APPLICAT(i-1),"-#.###")
		      Listbox_Scrapers.Cell(4,i)=Format(app.DOSE_ZONE(i-1),"#")
		      Listbox_Scrapers.Cell(5,i)=Format(app.IREGION_TO_BIT(i-1),"#")
		      Listbox_Scrapers.Cell(6,i)=app.MED_IN(i-1)
		    next
		    
		  elseif app.Ishape=1 Then
		    Listbox_Scrapers.AddRow "Z of front face of scraper (cm)"
		    Listbox_Scrapers.AddRow "Thickness of scraper (cm)"
		    Listbox_Scrapers.AddRow "Halfwidth of inner opening in x (cm)"
		    Listbox_Scrapers.AddRow "Halfwidth of inner opening in y (cm)"
		    Listbox_Scrapers.AddRow "Width of scraper bar in x (cm)"
		    Listbox_Scrapers.AddRow "Width of scraper bar in y (cm)"
		    Listbox_Scrapers.AddRow "Dose scoring zone"
		    Listbox_Scrapers.AddRow "Associate with LATCH bit"
		    Listbox_Scrapers.AddRow "Material"
		    
		    for i=1 to app.N_APPLICAT
		      Listbox_Scrapers.ColumnType(i)=3
		      Listbox_Scrapers.Cell(0,i)=Format(app.ZMIN_APPLICAT(i-1),"-#.###")
		      Listbox_Scrapers.Cell(1,i)=Format(app.ZTHICK_APPLICAT(i-1),"-#.###")
		      Listbox_Scrapers.Cell(2,i)=Format(app.XMIN_APPLICAT(i-1),"-#.###")
		      Listbox_Scrapers.Cell(3,i)=Format(app.YMIN_APPLICAT(i-1),"-#.###")
		      Listbox_Scrapers.Cell(4,i)=Format(app.WIDTHX_APPLICAT(i-1),"-#.###")
		      Listbox_Scrapers.Cell(5,i)=Format(app.WIDTHY_APPLICAT(i-1),"-#.###")
		      Listbox_Scrapers.Cell(6,i)=Format(app.DOSE_ZONE(i-1),"#")
		      Listbox_Scrapers.Cell(7,i)=Format(app.IREGION_TO_BIT(i-1),"#")
		      Listbox_Scrapers.Cell(8,i)=app.MED_IN(i-1)
		    next
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		APP As Class_BEAM_CM_APPLICAT
	#tag EndProperty

	#tag Property, Flags = &h0
		donothing As boolean = true
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton_Close
	#tag Event
		Sub Action()
		  Window_BEAM_Options_APPLICAT_Scrapers.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Listbox_Scrapers
	#tag Event
		Function HeaderPressed(column as Integer) As Boolean
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub CellTextChange(row as Integer, column as Integer)
		  if donothing=False Then
		    
		    if column>=1 Then
		      if app.Ishape=1 Then // for rect shapes
		        if row=0 Then
		          app.ZMIN_APPLICAT(column-1)=val(me.Cell(row,column))
		          
		        elseif row=1 Then
		          app.ZTHICK_APPLICAT(column-1)=val(me.Cell(row,column))
		          
		          
		        elseif row=2 Then
		          app.XMIN_APPLICAT(column-1)=val(me.Cell(row,column))
		          
		        elseif row=3 Then
		          app.YMIN_APPLICAT(column-1)=val(me.Cell(row,column))
		          
		        elseif row=4 Then
		          app.WIDTHX_APPLICAT(column-1)=val(me.Cell(row,column))
		          
		        elseif row=5 Then
		          app.WIDTHY_APPLICAT(column-1)=val(me.Cell(row,column))
		          
		        elseif row=6 Then
		          app.DOSE_ZONE(column-1)=val(me.Cell(row,column))
		          
		        elseif row=7 Then
		          app.IREGION_TO_BIT(column-1)=val(me.Cell(row,column))
		          
		        elseif row=8 Then
		          app.MED_IN(column-1)=trim(me.Cell(row,column))
		        end
		        
		      elseif app.Ishape=0 Then
		        // For square shapes
		        
		        if row=0 Then
		          app.ZMIN_APPLICAT(column-1)=val(me.Cell(row,column))
		          
		        elseif row=1 Then
		          app.ZTHICK_APPLICAT(column-1)=val(me.Cell(row,column))
		          
		        elseif row=2 Then
		          app.XMIN_APPLICAT(column-1)=val(me.Cell(row,column))
		          
		        elseif row=3 Then
		          app.WIDTHX_APPLICAT(column-1)=val(me.Cell(row,column))
		          
		        elseif row=4 Then
		          app.DOSE_ZONE(column-1)=val(me.Cell(row,column))
		          
		        elseif row=5 Then
		          app.IREGION_TO_BIT(column-1)=val(me.Cell(row,column))
		          
		        elseif row=6 Then
		          app.MED_IN(column-1)=trim(me.Cell(row,column))
		        end
		        
		        
		      end
		      
		      
		    end
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="donothing"
		Group="Behavior"
		InitialValue="true"
		Type="boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
