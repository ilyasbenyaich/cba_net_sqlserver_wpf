   M S B A M L   `   `   `  ����  Cba    CbaView.Banks   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35` \RibbonControlsLibrary, Version=3.5.41019.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      -   5          � 	Resources  5         
BankSource��%   &	        �� 5	   
   6   5
      .��5      �  � DataContext 6   ��  �� Source# [   � ColumnDefinitions 5   
   �� 5      $	��300 �6   �� 5      $	��200 �6   �� 5      $	��300 �6    � RowDefinitions 5   
   �� 5      $��40 �6   �� 5      $
��200* �6   .+�5   
   �� -   5        $��ListBox1��5      $��1��6   $ �� IsSynchronizedWithCurrentItem$
 TrueY�6G   ��6/   �� ��5      �� 5      .R�5      ��  �� Orientation$ 
Horizontal=�6!   .+�5      �� $��50��6$   ��6/   ��  �� Path$ Id��� 5      ��6$   �� $
 Name�5      5      5      �� 5   
   -   5        $��StackPanel1��5      $��1��6(   $��1��65   .+�5       �� -   5        $��Label1��5        $��28��6   $
��Auto��6.   $��Right=�6;   $��3q�6^   .��6i   
Bank ID:6s   �� 5!      -   5        $��Label2��5!       $��28��6   $
��Auto��6.   $��Right=�6;   $��3q�6^   .��6i   Code:6p   �� 5"      -   5        $��Label3��5"       $��28��6   $
��Auto��6.   $��Right=�6;   $��3q�6^   .��6i   Name:6p   5$      �� 5%   
   -   5        $��StackPanel2��5%   2   $��1��6   $��2��6"   .+�5'      �� -   5        $��TextBox1��5'   4    �� 
IsReadOnly . $��28��6(   $
��Auto��6D   $��3q�6Q   
���������5(      �� $ Id�	 �� Mode$	 OneWay=�6<   �� 5*      -	   5        $��TextBox3��5*   "   $��28��6   $
��Auto��62   $��3q�6?   ��5+      �� $
 Code��� 5-      -
   5        $��TextBox2��5-   "   $��28��6   $
��Auto��62   $��3q�6?   ��5.      �� $
 Name��� 51      $ 
Horizontal=�6   .+�52      �� -   5        $��btnAdd��52      $	��Top=�6(   $��75��6@   $��23��6K   .��6p   Add6u   �� 53      -   5        $��btnSave��53      $	��Top=�6(   $��75��6@   $��23��6K   .��6q   Save6w   �� 54      -   5        $��	btnDelete��54      $	��Top=�6(   $��75��6@   $��23��6K   .��6s   Delete6{   55      56      58      59      