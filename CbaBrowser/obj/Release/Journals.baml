   M S B A M L   `   `   `  ����   Cba    CbaView.Journals   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35` \RibbonControlsLibrary, Version=3.5.41019.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     -     � 	Resources     JournalSource  LegalEntityLookup  CurrencyLookup  PeriodLookup  AccountLookup  JournalLinesSource �� Source �� Source �� Path��%   &	        &	      &	 
     &	      &	      &	      7   �� �� �� �� �� ��  �� 8   $ JournalLines�.���  � DataContext �� # [   � ColumnDefinitions �� $	��300 ��� $	��200 ��� $	��300 � � RowDefinitions �� $��40 ��� $
��200* �.+��� -   $��ListBox1��$��1��$ �� IsSynchronizedWithCurrentItem$
 TrueY����� ���� .R���  �� Orientation$ 
Horizontal=�.+��� $��50������ $ Id��� ���� $
 Name��� -   $��StackPanel1��$��1��$��1��.+��� -   $��Label1��$��28��$
��Auto��$��Right=�$��3q�.��Journal ID:�� -   $��Label2��$��28��$
��Auto��$��Right=�$��3q�.��Name:�� -   $��Label3��$��28��$
��Auto��$��Right=�$��3q�.��Description:�� -   $��Label4��$��28��$
��Auto��$��Right=�$��3q�.��Legal Entity:�� -   $��Label5��$��28��$
��Auto��$��Right=�$��3q�.��	Currency:�� -	   $��Label6��$��28��$
��Auto��$��Right=�$��3q�.��	Period:�� -
   $��Label7��$��28��$
��Auto��$��Right=�$��3q�.��Total Debit:�� -   $��Label8��$��28��$
��Auto��$��Right=�$��3q�.��Total Credit:�� -   $��Label9��$��28��$
��Auto��$��Right=�$��3q�.��	Balanced:�� -   $��StackPanel2��$��1��$��2��.+��� -   $��TextBox1��	 �� 
IsReadOnly	 . $��28��$
��Auto��$��3q�
����������� $ Id�
 �� Mode$
 OneWay=��� -   $��TextBox2��$��28��$
��Auto��$��3q����� $
 Name��� -   $��TextBox3��$��28��$
��Auto��$��3q����� $ Description��� -   $��	ComboBox1��$��28��$
��Auto��$��3q� �� 
IsEditable .  ���� # [  �� SelectedItem �� $ JournalLegalEntity����� .R��� $ 
Horizontal=�.+��� ���� $
 Name��� -   $��	ComboBox2��$��28��$
��Auto��$��3q� .  ���� # [  �� $ JournalCurrency����� .R��� $ 
Horizontal=�.+��� ���� $
 Code��� -   $��	ComboBox3��$��28��$
��Auto��$��3q� .  ���� # [  �� $ JournalPeriod����� .R��� $ 
Horizontal=�.+��� ���� $
 Name��� -   $��TextBox4��	 . $��28��$
��Auto��$��3q�
����������� $ 
TotalDebit�$
 OneWay=��� -   $��TextBox5��	 . $��28��$
��Auto��$��3q�
����������� $ TotalCredit�$
 OneWay=��� -   $��TextBox6��	 . $��28��$
��Auto��$��3q�
����������� $ BalancedFlag�$
 OneWay=��� $ 
Horizontal=�.+��� -   $��btnAdd��$	��Top=�$��75��$��23��.��New�� -   $��btnSave��$	��Top=�$��75��$��23��.��Save�� -   $��	btnDelete��$	��Top=�$��75��$��23��.��Delete�� -   $��	ListView1��$��3��$
 TrueY����� # [ ����  �� 
TargetType" ��.���  �� Property � �� �� Value$ Stretch=� �� View �� .P��� $��ID�� �� Width$ 75�� �� CellTemplate �� .R��� $��	-6,0,-6,0q����� $ LineId��� $��Amount��$ 75�� �� .R��� $��	-6,0,-6,0q����� $ Amount��� $��Debit / Credit��$ 75�� �� .R��� $��	-6,0,-6,0q����� $ DebitCreditFlag��� $��Account��$	 150�� �� .R��� $��
cboAccount�� .  $ FalseY� �� DisplayMemberPath$
 Code��$��	-6,0,-6,0q����� # [  �� SelectedValue �� $ LineAccount��� $ 
Horizontal=�.+��� -   $��btnJournalLinesdAdd��$	��Top=�$��75��$��23��.��
Add Line�� -   $��btnJournalLinesDelete��$	��Top=�$��75��$��23��.��Delete Line