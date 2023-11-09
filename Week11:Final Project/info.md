# C like Custom Compiler using Python

## Group Members
Joseph Dua Vunanga - 136371  <br>
Lee Leonard Sangoroh - 134327 <br>
Sydney Gabriel Temba - 135255 <br>
Michelle Were Ambunya - 135200 <br>
Larry Mutoni  - 135957

## Project Guidelines

### a. Description
The project is an implementation of a custom C like programming language compiler.
The project aims to design and implement a compiler for a C-like programming language. 
The language is defined by a formal grammar, and the compiler is built to handle lexical analysis, 
syntax parsing, semantic analysis, and code generation.

### b. Modules

**Lexer (scanner.py):** 

This module tokenizes the input source code, breaking it down 
into a stream of tokens that represent the fundamental language elements.

**Parser (cparser.py):** 

The parser utilizes a parsing table and the Earley parsing algorithm 
to analyze the syntactic structure of the source code. 
It constructs a syntax tree using the anytree library.

**Semantic Analyzer (semantic_analyzer.py):** 

This component performs semantic analysis 
on the syntax tree, ensuring that the program follows the language's rules and constraints. 
It also performs type-checking and gathers information for code generation.

**Code Generator (code_gen.py):** 

The code generator takes the validated syntax tree 
and produces target code (e.g., assembly or machine code) 
based on the specifications of the custom programming language.

#### Dependencies:

Python 3.x <br>
anytree library <br>
IDE : Pycharm 

```python
from anytree import Node, RenderTree, PreOrderIter
```

### c. Running the modules

The input file are used fo testing. The path to the input file is specified in the lexer. <br>
To run the scanner we just **`cd`** into the modules folder and run the appropriate file.

#### Running the lexer:

```bash
python scanner.py
```
This will output the number of time taken to scan and tokenize the input file as per the last lines of code in the scanner.py file. <br>
It will also generate 2 outputs files which are stored in the output folder : <br>

    1. tokens.txt 
    2. symbol_table.txt 

And an error file in case issues are encountered along the way. This file is stored in the errors folder <br>

    lexical_errors.txt

#### Running the parser:

```bash
python cparser.py
```
This will output the number of time taken to parser the input file as per the last lines of code in the cparser.py file. <br>
It will also generate 2 outputs files which are stored in the output folder : <br>

    1. output.txt 
    2. parse_tree.txt 

And 2 error files in case issues are encountered along the way. These files are stored in the errors folder <br>

    semantic_errors.txt
    syntax_errors.txt
