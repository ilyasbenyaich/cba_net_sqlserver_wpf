   M S B A M L   `   `   `  ����   Cba    CbaView.Addresses   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35` \RibbonControlsLibrary, Version=3.5.41019.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     -     � 	Resources     AddressSource  CountryLookup��%   &	        &	      �� �� .���  � DataContext ��  �� Source# [   � ColumnDefinitions �� $	��300 ��� $	��200 ��� $	��300 � � RowDefinitions �� $��40 ��� $
��200* �.+��� -   $��ListBox1��$��1��$ �� IsSynchronizedWithCurrentItem$
 TrueY����� ���� .R���  �� Orientation$ 
Horizontal=�.+��� $��50������  �� Path$ Id��� ���� $
 Type��� -   $��StackPanel1��$��1��$��1��.+��� -   $��Label1��$��28��$
��Auto��$��Right=�$��3q�.��Address ID:�� -   $��Label6��$��28��$
��Auto��$��Right=�$��3q�.��Type:�� -   $��Label2��$��28��$
��Auto��$��Right=�$��3q�.��
Address:�� -   $��Label3��$��28��$
��Auto��$��Right=�$��3q�.��City:�� -   $��Label4��$��28��$
��Auto��$��Right=�$��3q�.��State/Province:�� -	   $��Label5��$��28��$
��Auto��$��Right=�$��3q�.��
Country:�� -
   $��StackPanel2��$��1��$��2��.+��� -   $��TextBox1�� �� 
IsReadOnly . $��28��$
��Auto��$��3q�
����������� $ Id�	 �� Mode$	 OneWay=��� -   $��TextBox5��$��28��$
��Auto��$��3q����� $
 Type��� -   $��TextBox2��$��28��$
��Auto��$��3q����� $ Street��� -   $��TextBox3��$��28��$
��Auto��$��3q����� $
 City��� -   $��TextBox4��$��28��$
��Auto��$��3q����� $ RegionProvince��� -   $��	ComboBox1��$��28��$
��Auto��$��3q�
 �� 
IsEditable
 .  ���� # [  �� SelectedItem �� $ AddressTerritory����� .R��� $ 
Horizontal=�.+��� ���� $
 Name��� $ 
Horizontal=�.+��� -   $��btnAdd��$	��Top=�$��75��$��23��.��Add�� -   $��btnSave��$	��Top=�$��75��$��23��.��Save�� -   $��	btnDelete��$	��Top=�$��75��$��23��.��Delete