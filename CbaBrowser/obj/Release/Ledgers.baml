   M S B A M L   `   `   `  ����   Cba    CbaView.Ledgers   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35` \RibbonControlsLibrary, Version=3.5.41019.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     -     � 	Resources     LedgerSource  ChartLookup  CurrencyLookup��%-   &	        &	      &	 
     �� �� �� .���  � DataContext ��  �� Source# [   � ColumnDefinitions �� $	��300 ��� $	��200 ��� $	��300 � � RowDefinitions �� $��40 ��� $
��200* �.+��� -   $��ListBox1��$��1��$ �� IsSynchronizedWithCurrentItem$
 TrueY����� ���� .R���  �� Orientation$ 
Horizontal=�.+��� $��50������  �� Path$ Id��� ���� $
 Name��� -   $��StackPanel1��$��1��$��1��.+��� -   $��Label1��$��28��$
��Auto��$��Right=�$��3q�.��
Ledger ID:�� -   $��Label3��$��28��$
��Auto��$��Right=�$��3q�.��Name:�� -   $��Label4��$��28��$
��Auto��$��Right=�$��3q�.��Chart:�� -   $��Label5��$��28��$
��Auto��$��Right=�$��3q�.��	Currency:�� -   $��StackPanel2��$��1��$��2��.+��� -	   $��TextBox1�� �� 
IsReadOnly . $��28��$
��Auto��$��3q�
����������� $ Id�	 �� Mode$	 OneWay=��� -
   $��TextBox2��$��28��$
��Auto��$��3q����� $
 Name��� -   $��	ComboBox1��$��28��$
��Auto��$��3q�
 �� 
IsEditable
 .  ���� # [  �� SelectedItem �� $ LedgerChart����� .R��� $ 
Horizontal=�.+��� ���� $
 Name��� -   $��	ComboBox2��$��28��$
��Auto��$��3q�
 .  ���� # [  �� $ LedgerCurrency����� .R��� $ 
Horizontal=�.+��� ���� $
 Code��� $ 
Horizontal=�.+��� -   $��btnAdd��$	��Top=�$��75��$��23��.��Add�� -   $��btnSave��$	��Top=�$��75��$��23��.��Save�� -   $��	btnDelete��$	��Top=�$��75��$��23��.��Delete