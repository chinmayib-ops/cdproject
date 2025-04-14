

A FLEX and Bison-based compiler for a subset of the Python programming language.


About the Project

This project implements a compiler front-end for a small subset of Python using FLEX and Bison. The compiler performs lexical analysis and syntax parsing for variable declarations, arithmetic expressions, and assignment operations. It demonstrates the use of Context-Free Grammars (CFGs) in compiler design and provides a basic framework for further development.

Objective
The main goal is to design and implement:
1. A Context-Free Grammar (CFG) to define the syntax of the subset.
2. A lexical analyzer using FLEX to tokenize the input.
3. A syntax analyzer using Bison to validate the token stream against the CFG.

 Features

- **Lexical Analysis**: Tokenizes keywords, identifiers, literals, operators, and delimiters.
- **Syntax Analysis**: Validates declarations and expressions based on CFG rules.
- **Error Handling**: Reports syntax errors with meaningful messages.
- **Expandable Framework**: Can be extended to support additional Python constructs.

---

## **Technologies Used**

- **FLEX**: For lexical analysis.
- **Bison**: For syntax analysis.
- **C Programming Language**: For integration of FLEX and Bison-generated code.

---

## **Installation**

Follow these steps to set up the project locally:

1. Clone the repository:
   ```bash
   git clone https://github.com//compiler-design-project.git
   ```
2. Navigate to the project directory:
   ```bash
   cd compiler-design-project
   ```
3. Compile the lexer and parser:
   ```bash
   flex lexer.l
   bison -d parser.y
   gcc lex.yy.c parser.tab.c -o compiler -lfl
   ```

---

## **Usage**

To run the compiler:
1. Execute the compiled program:
   ```bash
   ./compiler
   ```
2. Enter your program input when prompted. Example:
   ```plaintext
   var x = 5
   x + 10
   var y = x * 2
   ```

The program will validate the syntax and provide feedback on whether it is valid or invalid.

---

## **Sample Input and Output**

### ✅ **Valid Input**
```plaintext
var x = 10
x + 20
```

**Output:**
```plaintext
Enter your program:
Valid Declaration: x
Valid Expression: x + 20
```

### ❌ **Invalid Input**
```plaintext
var = y
```

**Output:**
```plaintext
Enter your program:
Error: Syntax error at '='. Expected an identifier after 'var'.
```

---

## **Contributing**

Contributions are welcome! Follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -m "Add feature"`).
4. Push to the branch (`git push origin feature-name`).
5. Open a pull request.
