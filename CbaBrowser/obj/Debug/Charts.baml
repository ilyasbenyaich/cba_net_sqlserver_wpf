   M S B A M L   `   `   `  ����  Cba    CbaView.Charts   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35` \RibbonControlsLibrary, Version=3.5.41019.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      -   5          � 	Resources  5         ChartSource  AccountSource �� Source �� Source �� Path��%c   &	        &	      7   �� 5	   
   6   �� 5
   
    5      �� 8   $ ChartAccount�5      .��5      �  � DataContext 6   �� # [   � ColumnDefinitions 5   
   �� 5      $	��300 �6   �� 5      $	��200 �6   �� 5      $	��300 �6    � RowDefinitions 5   
   �� 5      $��40 �6   �� 5      $
��200* �6   .+�5   
   �� -   5        $��ListBox1��5      $��1��6   $ �� IsSynchronizedWithCurrentItem$
 TrueY�6G   ��6/   �� ��5      �� 5      .R�5      ��  �� Orientation$ 
Horizontal=�6!   .+�5      �� $��50��6$   ��6/   �� $ Id��� 5      ��6$   �� $
 Name�5      5       5"      �� 5#   
   -   5        $��StackPanel1��5#      $��1��6(   $��1��65   .+�5$      �� -   5        $��Label1��5$       $��28��6   $
��Auto��6.   $��Right=�6;   $��3q�6^   .��6i   	Chart ID:6t   �� 5%      -   5        $��Label2��5%       $��28��6   $
��Auto��6.   $��Right=�6;   $��3q�6^   .��6i   Name:6p   �� 5&      -   5        $��Label3��5&       $��28��6   $
��Auto��6.   $��Right=�6;   $��3q�6^   .��6i   Short Description:6}   5'      �� 5(   
   -   5        $��StackPanel2��5(   2   $��1��6   $��2��6"   .+�5)      �� -   5        $��TextBox1��5)   4   	 �� 
IsReadOnly	 . $��28��6(   $
��Auto��6D   $��3q�6Q   
���������5*      �� $ Id�
 �� Mode$
 OneWay=�6<   �� 5,      -	   5        $��TextBox2��5,   "   $��28��6   $
��Auto��62   $��3q�6?   ��5-      �� $
 Name��� 5/      -
   5        $��TextBox3��5/   "   $��28��6   $
��Auto��62   $��3q�6?   ��50      �� $ ShortDescription��� 52      $ 
Horizontal=�6   .+�53      �� -   5        $��btnAdd��53      $	��Top=�6*   $��75��6B   $��23��6M   .��6r   Add6w   �� 54      -   5        $��btnSave��54      $	��Top=�6*   $��75��6B   $��23��6M   .��6s   Save6y   �� 55      -   5        $��	btnDelete��55      $	��Top=�6*   $��75��6B   $��23��6M   .��6u   Delete6}   56      �� 57   
   -   5        $��	ListView1��57       $��3��6   $
 TrueY�58      $��Visible=�59   R   $��Visible=�6�   ��6   �� # [ ��5:      �� 5;       �� 
TargetType" ��6   .�5<      ��  �� Property � �� �� Value$ Stretch=�6G   �� 5=       � �� . 6J   5>       �� View 5@      �� 5A      .P�5B      �� $��ID��6%    �� Width$ 75��61    �� CellTemplate 5C      �� 5D      .R�5E   "   �� $��	-6,0,-6,0q�5F   (   ��5E   (   �� $ Id�5F   (   5G      5I      �� 5J      $
��Code��6%   $ 75��63    5K      �� 5L      .R�5M   "   �� $��	-6,0,-6,0q�5N   (   ��5M   *   �� $
 Code�5N   (   5O      5Q      �� 5R      $
��Name��6%   $ 75��63    5S      �� 5T      .R�5U   "   �� $��	-6,0,-6,0q�5V   *   ��5U   *   �� $
 Name�5V   *   5W      5Y      5[      5]      �� 5^   
   $ 
Horizontal=�6   .+�5_      �� -   5        $��btnAccountdAdd��5_      $	��Top=�6.   $��75��6F   $��23��6Q   .��6z   Add6   �� 5`      -   5        $��btnAccountDelete��5`      $	��Top=�6-   $��75��6E   $��23��6P   .��6|   Delete6�   5a      5b      5c      5d      