   M S B A M L   `   `   `  ����   Cba    CbaView.Taxes   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35` \RibbonControlsLibrary, Version=3.5.41019.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     -     � 	Resources     	TaxSource  CountryLookup��%   &	        &	      �� �� .���  � DataContext ��  �� Source# [   � ColumnDefinitions �� $	��300 ��� $	��200 ��� $	��300 � � RowDefinitions �� $��40 ��� $
��200* �.+��� -   $��ListBox1��$��1��$ �� IsSynchronizedWithCurrentItem$
 TrueY����� ���� .R���  �� Orientation$ 
Horizontal=�.+��� $��50������  �� Path$ Id��� ���� $
 Name��� -   $��StackPanel1��$��1��$��1��.+��� -   $��Label1��$��28��$
��Auto��$��Right=�$��3q�.��	Tax ID:�� -   $��Label2��$��28��$
��Auto��$��Right=�$��3q�.��Name:�� -   $��Label3��$��28��$
��Auto��$��Right=�$��3q�.��Rate:�� -   $��Label4��$��28��$
��Auto��$��Right=�$��3q�.��Type:�� -   $��Label5��$��28��$
��Auto��$��Right=�$��3q�.��Start Date:�� -	   $��Label6��$��28��$
��Auto��$��Right=�$��3q�.��	End Date:�� -
   $��Label7��$��28��$
��Auto��$��Right=�$��3q�.��
Territory:�� -   $��StackPanel2��$��1��$��2��.+��� -   $��TextBox1�� �� 
IsReadOnly . $��28��$
��Auto��$��3q�
����������� $ Id�	 �� Mode$	 OneWay=��� -   $��TextBox2��$��28��$
��Auto��$��3q����� $
 Name��� -   $��TextBox3��$��28��$
��Auto��$��3q����� $
 Rate��� -   $��TextBox4��$��28��$
��Auto��$��3q����� $
 Type��� -   $��TextBox5��$��28��$
��Auto��$��3q����� $ 	StartDate��� -   $��TextBox6��$��28��$
��Auto��$��3q����� $ EndDate��� -   $��	ComboBox1��$��28��$
��Auto��$��3q�
 �� 
IsEditable
 .  ���� # [  �� SelectedItem �� $ TaxTerritory����� .R��� $ 
Horizontal=�.+��� ���� $
 Name��� $ 
Horizontal=�.+��� -   $��btnAdd��$	��Top=�$��75��$��23��.��Add�� -   $��btnSave��$	��Top=�$��75��$��23��.��Save�� -   $��	btnDelete��$	��Top=�$��75��$��23��.��Delete