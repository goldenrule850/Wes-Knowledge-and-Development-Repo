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


