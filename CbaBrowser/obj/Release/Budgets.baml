   M S B A M L   `   `   `  ����   Cba    CbaView.Budgets   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35` \RibbonControlsLibrary, Version=3.5.41019.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     -     � 	Resources     BudgetResource  CalendarLookup  LegalEntityLookup  AccountLookup  PeriodLookup  BudgetLinesResource �� Source �� Source �� Path��%~   &	        &	      &	 
     &	      &	      &	      7   �� �� �� �� �� ��  �� 8   $ BudgetLines�.���  � DataContext �� # [   � ColumnDefinitions �� $	��300 ��� $	��200 ��� $	��300 � � RowDefinitions �� $��40 ��� $
��200* �.+��� -   $��ListBox1��$��1��$ �� IsSynchronizedWithCurrentItem$
 TrueY����� ���� .R���  �� Orientation$ 
Horizontal=�.+��� $��50������ $ Id��� ���� $
 Name��� -   $��StackPanel1��$��1��$��1��.+��� -   $��Label1��$��28��$
��Auto��$��Right=�$��3q�.��	Budget ID�� -   $��Label2��$��28��$
��Auto��$��Right=�$��3q�.��Name�� -   $��Label3��$��28��$
��Auto��$��Right=�$��3q�.��Description�� -   $��Label4��$��28��$
��Auto��$��Right=�$��3q�.��
Calendar�� -   $��Label5��$��28��$
��Auto��$��Right=�$��3q�.��Legal Entity�� -	   $��StackPanel2��$��2��$��1��.+��� -
   $��TextBox1��	 �� 
IsReadOnly	 . $��28��$
��Auto��$��3q�
����������� $ Id��� -   $��TextBox2��$��28��$
��Auto��$��3q����� $
 Name��� -   $��TextBox3��$��28��$
��Auto��$��3q����� $ Description��� -   $��CombBox1��$��28��$
��Auto��$��3q�
 �� 
IsEditable
 .  ���� # [  �� SelectedItem �� $ BudgetCalendar����� .R��� $ 
Horizontal=�.+��� ���� $
 Name��� -   $��	ComboBox2��$
��Auto��$��3q�
 .  ���� # [  �� $ BudgetLegalEntity����� .R��� $ 
Horizontal=�.+��� ���� $
 Name��� $ 
Horizontal=�.+��� -   $��btnAdd��$	��Top=�$��75��$��23��.��New�� -   $��btnSave��$	��Top=�$��75��$��23��.��Save�� -   $��	btnDelete��$	��Top=�$��75��$��23��.��Delete�� -   $��	ListView1��$��3��$
 TrueY����� # [ ����  �� 
TargetType" ��.���  �� Property � �� �� Value$ Stretch=� �� View �� .P��� $��ID�� �� Width$ 75�� �� CellTemplate �� .R��� $��	-6,0,-6,0q����� $ LineId��� $��Amount��$ 75�� �� .R��� $��	-6,0,-6,0q����� $ Amount��� $��Account��$	 150�� �� .R��� $��
cboAccount��
 .  $ FalseY� �� DisplayMemberPath$
 Code��$��	-6,0,-6,0q����� # [  �� SelectedValue �� $ LineAccount��� $��Period��$	 150�� �� .R��� $��	cboPeriod��
 .  $ FalseY�$
 Name��$��	-6,0,-6,0q����� # [  �� $ 
LinePeriod��� $ 
Horizontal=�.+��� -   $��btnBudgetLinesdAdd��$	��Top=�$��75��$��23��.��
Add Line�� -   $��btnBudgetLinesDelete��$	��Top=�$��75��$��23��.��Delete Line