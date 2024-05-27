### Print Function

The `print` function is used to output text or other types of data to the console. It's one of the most basic and frequently used functions in Python.

#### Syntax

The basic syntax of the `print` function is:

```python
print(object, ..., sep=' ', end='\n', file=sys.stdout, flush=False)
```

- `object`: One or more objects to be printed, separated by commas.
- `sep`: String inserted between values, default is a space.
- `end`: String appended after the last value, default is a newline.
- `file`: A file-like object (stream); defaults to the current sys.stdout.
- `flush`: Whether to forcibly flush the stream.

##### Example

A simple example to print "Hello, World!":

```python
print('Hello, World!')
```

#### Common Errors

One common error is a typo in the function name. For example, the function name is typed as `prnt` instead of `print`.

```python
prnt('Hello, World!')
```

This will result in a `NameError` because `prnt` is not a defined function in Python. The error message you will see is:

```python
NameError: name 'prnt' is not defined
```

This error occurs because Python is case-sensitive and requires precise function names. Misspelling the function name leads to the interpreter not recognizing the command.

##### Corrected Example

To fix the error, you should correct the typo:

```python
print('Hello, World!')
```

This will properly output:

```plaintext
Hello, World!
```

```ad-tip
#### Using Single Quotes for Strings in Python

In Python, it's often considered best practice to use single quotes (`'`) for string literals. This can make your code cleaner and more consistent, especially when dealing with strings that include double quotes (`"`).

#### Why Single Quotes?

- **Consistency**: Using single quotes consistently can make the codebase uniform and easier to read.
- **Ease of Use**: Single quotes are simpler to use when your string contains double quotes, avoiding the need for escaping.
- **Readability**: It can improve readability when mixed with other types of quotations or string delimiters.
```

#### Example: Using Single Quotes for Cleaner Code

##### Single Quotes

If your string contains double quotes, using single quotes for the string allows you to avoid escaping:

```python
message = 'She said, "Hello, World!"'
print(message)
```

##### Output:
```plaintext
She said, "Hello, World!"
```

##### Double Quotes (with Escaping)

When you need to include double quotes inside a string that's enclosed by double quotes, you must use the escape character (`\`) to avoid syntax errors. This process is known as "escaping."

###### Example of Escaping Double Quotes

If you have a string that includes double quotes and you want to enclose the string with double quotes, you need to escape the internal double quotes:

Using double quotes for a string that contains double quotes requires escaping the internal quotes:

```python
message = "She said, \"Hello, World!\""
print(message)
```

##### Output:
```plaintext
She said, "Hello, World!"
```

##### Comparing Readability

- **Single Quotes**: `'She said, "Hello, World!"'`
- **Double Quotes with Escaping**: `"She said, \"Hello, World!\""`

The single-quote notation is more readable and less cluttered, making it easier to understand at a glance.

#### Escaping Single Quotes in Python

When you need to include an apostrophe (single quote) inside a string that's enclosed by single quotes, you must use the escape character (`\`) to avoid syntax errors.

##### Example of Escaping Single Quotes

If you have a string that includes an apostrophe and you want to enclose the string with single quotes, you need to escape the internal apostrophe:

```python
message = 'It\'s a beautiful day!'
print(message)
```

##### Output:
```plaintext
It's a beautiful day!
```

- The backslash (`\`) before the apostrophe tells Python to treat the apostrophe as a literal character within the string, rather than the end of the string.
- This allows you to include apostrophes and other special characters in strings without causing syntax errors.

An alternative to escaping single quotes is using double quotes to enclose the string:
```python
message = "It's a beautiful day!"
print(message)
```

##### Output:
```plaintext
It's a beautiful day!
```


#### Calling Two Functions on the Same Line in Python

In Python, calling two functions on the same line without proper separation will cause syntax errors. Functions should be called in separate statements or properly chained if they return values that are compatible.

##### Example of Incorrect Function Calls on the Same Line

If you try to call two `print` functions on the same line without separation, you will encounter a syntax error:

```python
print('Hello,') print('World!')
```

This code will result in a `SyntaxError` because Python expects a separator (like a semicolon) or a newline between function calls.

###### Error Message

The error message will look like this:

```plaintext
SyntaxError: invalid syntax
```

##### Correcting the Error

To correct this, you can use one of the following approaches:

1. **Separate Statements**: Place each function call on a separate line.
2. **Using a Semicolon**: Separate the function calls with a semicolon to place them on the same line.
3. **Combining the Output**: Use a single `print` statement to combine the outputs.

###### 1. Separate Statements
```python
print('Hello,')
print('World!')
```

###### Output:
```plaintext
Hello,
World!
```

###### 2. Using a Semicolon
```python
print('Hello,'); print('World!')
```

###### Output:
```plaintext
Hello,
World!
```

###### 3. Combining the Output
```python
print('Hello,', 'World!')
```

###### Output:
```plaintext
Hello, World!
```

#### `\n` Newline in Python

The newline character `\n` is used in Python to insert a new line in a string. This character tells the Python interpreter to move to the next line when printing the string.

##### Example
```python
message = "Hello, World!\nWelcome to Python programming."
print(message)
```

##### Output
```plaintext
Hello, World!
Welcome to Python programming.
```

In this example, `\n` is used to split the string into two lines. When the `print` function is called, it outputs the text with a newline in between.

##### More Complex Example

Here's a more complex example using `\n` to format a multi-line address:

```python
address = "John Doe\n123 Main Street\nAnytown, USA"
print(address)
```

##### Output
```plaintext
John Doe
123 Main Street
Anytown, USA
```

In this case, each part of the address is separated by `\n`, which ensures that each line of the address is printed on a new line.

##### Using `\n` in Multiline Strings

For longer texts, you can also use triple quotes (`'''` or `"""`) to create multi-line strings, which automatically include newlines:

```python
message = """Hello, World!
Welcome to Python programming.
Enjoy your coding journey!"""
print(message)
```

##### Output
```plaintext
Hello, World!
Welcome to Python programming.
Enjoy your coding journey!
```

### Variables

In Python, variables are used to store data that can be referenced and manipulated throughout your code. Variables can hold different types of data, such as numbers, strings, lists, and more.

#### Declaring a Variable

To declare a variable in Python, you simply assign a value to it using the equals sign (`=`). Unlike some other programming languages, you do not need to specify the type of the variable.

##### Example of a String Variable

Let's create a variable that holds the string "Hello World!" and then use the `print` function to output this variable.

```python
# Declare a variable and assign a string to it
greeting = "Hello, World!"

# Use the print function to access and print the variable
print(greeting)
```

##### Explanation

1. **Variable Declaration**:

```python
greeting = "Hello, World!"
```

Here, `greeting` is the variable name, and it is assigned the string value `"Hello, World!"`.

2. **Using the Variable**:
```python
print(greeting)
```

The `print` function is used to output the value stored in the `greeting` variable. When you pass the variable to `print`, it retrieves the value `"Hello, World!"` and prints it to the console.

#### Reassigning a Variable in Python

In Python, you can reassign a variable to a new value at any point in your code. This allows you to update the value stored in the variable as needed.

##### Example: Reassigning a Variable

Let's take the `greeting` variable from the previous example, reassign it to a new string, and then print the new value.

```python
# Initial assignment of the variable
greeting = "Hello, World!"

# Print the initial value
print(greeting)

# Reassign the variable to a new string
greeting = "Goodbye, World!"

# Print the new value
print(greeting)
```

##### Explanation

1. **Initial Assignment**:
```python
greeting = "Hello, World!"
```

The variable `greeting` is initially assigned the string `"Hello, World!"`.

2. **Printing the Initial Value**:
```python
print(greeting)
```

This prints the initial value of the `greeting` variable:
```plaintext
Hello, World!
```

3. **Reassigning the Variable**:
```python
greeting = "Goodbye, World!"
```

The variable `greeting` is reassigned to a new string `"Goodbye, World!"`.

4. **Printing the New Value**:
```python
print(greeting)
```

This prints the new value of the `greeting` variable:
```plaintext
Goodbye, World!
```

##### Output

The output of the above code will be:
```plaintext
Hello, World!
Goodbye, World!
```

#### Using Variables in Python Functions

In Python, a function cannot use a variable if the variable is not defined before its use. This is because Python needs to know the value or existence of the variable at the time it is referenced. If a variable is referenced before it is assigned a value, Python will raise a `NameError`.

##### Example of a NameError

Let's examine the code from the screenshot and understand why the error occurs:

```python
print(new_greeting)
new_greeting = 'New Greeting 1'
```

##### Explanation

1. **Order of Statements**:
    
    - The first statement attempts to print the value of `new_greeting`.
    - The second statement assigns the string `'New Greeting 1'` to the variable `new_greeting`.
2. **Error**:
    
    - Since `new_greeting` is referenced before it is assigned a value, Python raises a `NameError`.

##### Correct Order

To fix this issue, you need to ensure that the variable is defined before it is used:
```python
new_greeting = 'New Greeting 1'
print(new_greeting)
```

#### Correct Code Explanation

1. **Variable Assignment**:
```python
new_greeting = 'New Greeting 1'
```

The variable `new_greeting` is assigned the string `'New Greeting 1'`.

2. **Using the Variable**:
```python
print(new_greeting)
```

The `print` function now successfully references `new_greeting` because it has already been assigned a value.

#### Defining Variables in Python

In Python, variables can be defined using a name that follows certain rules. These rules ensure that variable names are valid and do not conflict with Python's syntax or reserved keywords.

##### Rules for Variable Names

1. **Start with a Letter or Underscore**: A variable name must begin with a letter (a-z, A-Z) or an underscore (_).
2. **Followed by Letters, Digits, or Underscores**: After the initial character, the variable name can contain letters, digits (0-9), or underscores.
3. **Case-Sensitive**: Variable names are case-sensitive, meaning `variable`, `Variable`, and `VARIABLE` are different variables.
4. **No Reserved Keywords**: Variable names cannot be the same as Python's reserved keywords (e.g., `for`, `while`, `class`, `True`, `False`).
##### Examples of Valid Variable Names
```python
variable1 = 10
_variable = "Hello"
var_123 = [1, 2, 3]
myVar = True
another_variable = 3.14
```

##### Examples of Invalid Variable Names

```python
1variable = 10        # Starts with a digit
var!able = "Hello"    # Contains an exclamation mark
my-var = [1, 2, 3]    # Contains a hyphen
for = True            # Uses a reserved keyword
```

##### Special Characters and Numbers

- **Special Characters**: Variable names cannot include special characters like `!`, `@`, `#`, `$`, `%`, `^`, `&`, `*`, `(`, `)`, `-`, `+`, `=`, etc.
- **Numbers**: While numbers can be included in variable names, they cannot be the first character.

```ad-important
#### Reserved Keywords as Variable Names

In Python, certain words are reserved for specific syntax and functionality. These reserved keywords cannot be used as variable names because they have predefined meanings in the language.

- **False, None, True**: Boolean and null values.
- **and, or, not, is**: Logical operators.
- **as, assert, async, await**: Context management and asynchronous programming.
- **break, continue, return, pass**: Loop and function control.
- **class, def, lambda**: Defining classes and functions.
- **del**: Deleting variables or elements.
- **elif, else, if**: Conditional statements.
- **except, finally, try**: Exception handling.
- **for, while**: Loop constructs.
- **from, import**: Importing modules.
- **global, nonlocal**: Variable scope.
- **in**: Membership test.
- **raise**: Raising exceptions.
- **with**: Context management.
- **yield**: Generators.
```

### Python Data Types: Integers

In Python, an integer is a data type used to represent whole numbers, both positive and negative, without any decimal point. Integers are commonly used for counting, indexing, and performing arithmetic operations.

#### Examples
```python
# Positive integer
a = 10

# Negative integer
b = -20

# Zero
c = 0

# Large integer
d = 1234567890
```

#### Operations with Integers

You can perform various arithmetic operations with integers, such as addition, subtraction, multiplication, and division.

##### Addition
```python
result = a + b
print(result)  # Output: -10
```

##### Subtraction
```python
result = a - b
print(result)  # Output: 30
```

##### Multiplication
```python
result = a * b
print(result)  # Output: -200
```

##### Division
```python
result = a / 2
print(result)  # Output: 5.0
```

### Python Data Types: Floats

In Python, a float (short for "floating-point number") is a data type used to represent real numbers that have a fractional part. Floats are used when more precision is needed compared to integers, especially for scientific calculations and measurements.

#### Examples of Floats
```python
# Positive float
a = 10.5

# Negative float
b = -20.75

# Zero as a float
c = 0.0

# Large float
d = 1234567890.1234567
```

#### Operations with Floats

You can perform various arithmetic operations with floats, such as addition, subtraction, multiplication, and division.

##### Addition
```python
result = a + b
print(result)  # Output: -10.25
```

##### Subtraction
```python
result = a - b
print(result)  # Output: 31.25
```

##### Multiplication
```python
result = a * b
print(result)  # Output: -217.875
```

##### Division
```python
result = a / 2
print(result)  # Output: 5.25
```

### Python Data Types: Booleans

In Python, a boolean is a data type used to represent truth values. There are only two boolean values: `True` and `False`. Booleans are commonly used in conditional statements and logical operations to control the flow of a program.

```ad-info
It is important to note that boolean values in Python must be capitalized (`True` and `False`).

Additionally, the number `1` represents the value of `True` and the number `0` represents the value of `False`.  This is a fundamental rule in programming.
```

#### Examples of Booleans
```python
# Boolean value representing truth
is_sunny = True

# Boolean value representing falsehood
is_raining = False
```

#### Creating Booleans

Booleans can be created by directly assigning `True` or `False` to a variable, or as the result of a comparison operation.

```python
# Direct assignment
is_hungry = True
is_tired = False

# Result of a comparison
is_equal = (5 == 5)       # True
is_not_equal = (5 != 5)   # False
is_greater = (10 > 5)     # True
is_less = (5 < 10)        # True
```

#### Logical Operations with Booleans

You can perform various logical operations with booleans, such as `and`, `or`, and `not`.

##### `and` Operator

```python
result = (5 > 2) and (10 > 5)   
print(result)  # Output: True
```

##### `or` Operator

```python
result = (5 > 2) or (10 < 5)   
print(result)  # Output: True
```

##### `not` Operator

```python
result = not (5 > 2)            
print(result)  # Output: False
```

#### Using Booleans in Conditional Statements

Booleans are often used in `if` statements to control the flow of a program based on conditions.

```python
is_hungry = True

if is_hungry:
    print("Time to eat!")
else:
    print("Not hungry right now.")
```

