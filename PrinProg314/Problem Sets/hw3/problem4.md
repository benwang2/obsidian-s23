```c
// Important pattern to follow: when in a call, first validate
// after validating, then get next token and make call as needed.
// The method call that spawned the call will get the next token.

main {
	token := next_token();
    int numOperators = <program>();
	if (token == eof)
		print("accept");
        printf("%d binary operators.",numOperators);
	else
		print("error");
}

int <program> {
	if (token != "prog") return error;
    token := next_token();
    int block_ops = <block>();
    token := next_token();
    if (token != ".") return error;
    return block_ops;
}

int <block> {
    if (token != "begin") return error;
    token := next_token();
    int stmtlist_ops = <stmtlist>();
    token := next_token();
    if (token != "end") return error;
    return stmtlist_ops;
}

int <stmtlist> {
    int stmt_ops = <stmt>();
    token := next_token();
    return stmt_ops + <morestmts>();
}

int <morestmts> {
    if (token == ";"){
        token := next_token();
        return <stmtlist>();
    } else if (token == "end"){
        return true;
    }
    return error;
}

int <stmt> {
    switch (token){
        case "a":
        case "b":
        case "c":
            return <assign>();
        case "if":
            return <ifstmt>();
        case "repeat":
            return <repeatstmt>();
        case "begin":
            return <block>();
        default: return error;
    }
}

int <assign> {
    if (!<var>()) return error;
    token := next_token();
    if (token != "=") return error;
    token := next_token();
    return 1 + <expr>();
}

int <ifstmt> { 
    if (token != "if") return error;
    token := next_token();
    int testexpr_ops = <testexpr>();
    token := next_token();
    if (token != "then") return error;
    token := next_token();
    int stmt_ops = <stmt>();
    token := next_token();
    if (token != "else") return error;
    token := next_token();
    return testexpr_ops + stmt_ops + <stmt>();
}

int <repeatstmt> {
    if (token != "repeat") return error;
    token := next_token();
    int stmt_ops = <stmt>();
    token := next_token();
    if (token != "until") return error;
    token := next_token();
    return stmt_ops + <testexpr>();
}

int <testexpr> { 
    if (!<var>()) return error;
    token := next_token();
    if (token != "<") return error;
    token := next_token();
    if (token != "=") return error;
    token := next_token();
    return <expr>();
}


int <expr> {
    switch(token){
        case "+":
        case "-":
        case "*":
            token := next_token();
            if (!<expr>()) return error;
            token := next_token();
            return <expr>();
    }
    return <var>() || <digit>();
}

int <var> {
    return (token == "a" || token == "b" || token == "c");
}

int <digit> {
    return (token == 0 || token == 1 || token == 2);
}
```