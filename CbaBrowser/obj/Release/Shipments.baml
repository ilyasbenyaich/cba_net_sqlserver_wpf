   M S B A M L   `   `   `  ����   Cba    CbaView.Shipments   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35` \RibbonControlsLibrary, Version=3.5.41019.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     -     � 	Resources     ShipmentsSource  BusinessPartnerLookup  LegalEntityLookup  PeriodLookup  ProductLookup  ShipmentLinesSource �� Source �� Source �� Path��%�   &	        &	      &	 
     &	      &	      &	      7   �� �� �� �� �� ��  �� 8   $ ShipmentLines�.���  � DataContext �� # [   � ColumnDefinitions �� $	��300 ��� $	��200 ��� $	��300 � � RowDefinitions �� $��40 ��� $
��200* �.+��� -   $��ListBox1��$��1��$ �� IsSynchronizedWithCurrentItem$
 TrueY����� ���� .R���  �� Orientation$ 
Horizontal=�.+��� $��50������ $ Id��� ���� $ Status��� -   $��StackPanel1��$��1��$��1��.+��� -   $��Label1��$��28��$
��Auto��$��Right=�$��3q�.��Shipment ID�� -   $��Label2��$��28��$
��Auto��$��Right=�$��3q�.��Status�� -   $��Label4��$��28��$
��Auto��$��Right=�$��3q�.��Legal Entity�� -   $��Label3��$��28��$
��Auto��$��Right=�$��3q�.��Business Partner�� -   $��Label5��$��28��$
��Auto��$��Right=�$��3q�.��Period�� -	   $��StackPanel2��$��2��$��1��.+��� -
   $��TextBox1��	 �� 
IsReadOnly	 . $��28��$
��Auto��$��3q�
����������� $ Id��� -   $��TextBox2��$��28��$
��Auto��$��3q����� $ Status��� -   $��	ComboBox2��$
��Auto��$��3q�
 �� 
IsEditable
 .  ���� # [  �� SelectedItem �� $ ShipmentLegalEntity����� .R��� $ 
Horizontal=�.+��� ���� $
 Name��� -   $��CombBox1��$��28��$
��Auto��$��3q�
 .  ���� # [  �� $ ShipmentBusinessPartner����� .R��� $ 
Horizontal=�.+��� ���� $
 Name��� -   $��	ComboBox3��$
��Auto��$��3q�
 .  ���� # [  �� $ ShipmentPeriod����� .R��� $ 
Horizontal=�.+��� ���� $
 Name��� $ 
Horizontal=�.+��� -   $��btnAdd��$	��Top=�$��75��$��23��.��New�� -   $��btnSave��$	��Top=�$��75��$��23��.��Save�� -   $��	btnDelete��$	��Top=�$��75��$��23��.��Delete�� -   $��	ListView1��$��3��$
 TrueY����� # [ ����  �� 
TargetType" ��.���  �� Property � �� �� Value$ Stretch=� �� View �� .P��� $��ID�� �� Width$ 75�� �� CellTemplate �� .R��� $��	-6,0,-6,0q����� $ LineId��� $��Quantity��$ 75�� �� .R��� $��	-6,0,-6,0q����� $ Quantity��� $��Price��$ 75�� �� .R��� $��	-6,0,-6,0q����� $ Price��� $��Total��$ 75�� �� .R��� $��	-6,0,-6,0q����� $ Total��� $��Product��$	 150�� �� .R��� $��
cboProduct��
 .  $ FalseY� �� DisplayMemberPath$
 Code��$��	-6,0,-6,0q����� # [  �� SelectedValue �� $ LineProduct��� $ 
Horizontal=�.+��� -   $��btnShipmentLinesdAdd��$	��Top=�$��75��$��23��.��
Add Line�� -   $��btnShipmentLinesDelete��$	��Top=�$��75��$��23��.��Delete Line