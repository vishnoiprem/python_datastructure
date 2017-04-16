
---------------------------------
STEP:1 for Run program:
---------------------------------

create Dir in Unix : mkdir rpn_cal
cd rpn_cal

put below files under rpn_cal dir

Operator.java
CalculatorException.java
Instruction.java
Calculator.java
RpnCalMain.java

--------------------------------------
STEP : 2 
--------------------------------------

Compile java 



javac Operator.java
javac Calculator.java
javac CalculatorException.java
javac Instruction.java
javac RpnCalMain.java




---------------------------------
Step : 3 run java main program
------------------------------
java RpnCalMain


---------------------------------
Step : 4 Test with given example
------------------------------

---Example 1

5 2
stack: 5 2 #as per expected 

---Example 2

2 sqrt
stack: 1.4142135623 
clear 9 sqrt  #as per expected  
stack: 3


---Example 3

5 2 - 
stack: 3 
3 - 
stack: 0 
clear 
stack: #as per expected


--Example 4

5 4 3 2
stack: 5 4 3 2 

undo undo * 
stack: 20

5 *
stack:
100 undo
stack: 20 5


---Example 5

7 12 2 / 
Stack: 7 6

*
stack: 42
4 /
stack: 10.5

--Example 6

1 2 3 4 5
stack: 1 2 3 4 5 
*
stack: 1 2 3 20 
clear 
3 4 - 
stack: -1


--Example 7

1 
2 3 4 5

Stack: 
1 2 3 4 5
Stack: 1 2 3 4  5

Stack: 1 2 3 4 5 
* * * *
Stack: 120 


Example 8

1 2 3 * 5 + * * 6 5


1 2 3 * 5 + * * 6 5
operator * (position: 8): insufficient parameters
Stack: 11 



