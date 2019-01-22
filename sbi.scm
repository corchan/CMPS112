
; pass over the top level, check for label in each line, each label is inserted into the label hash table
; this is recursive list iteration, program references top level node of the list, goes down the list, stores all labels it finds, stores each label referencing the top level node "program" as the value
(define (check-label program)
    (when not (null? (cdr program))
        ;current top level node has a label
        (when (symbol? (cadr(car program)))
            (put-label! (cadr(car program)) program)
        )
        ;the current top level node doest not have a label
        (when not (symbol? (cadr(car program)))
            (do soemthing?)
        )
     (when not (null? (cdr program))
        (check-label (cdr program))
     )

;interepret program function to check top level list and determine if a statement exists
(define (interpret-program program)
    ;if the given line does not contain a statement, move onto the next top level node recursively
    (when (null? (cadr (car program)))
        (interpret-program (cdr program))
    )
    ;if the given line doest contain a statement, lookup the statement in the statement-table and call function interpret-statement on it
    (when (symbol? (cadr (car program)))
        ;should reference the first item starting at the statement
        (car ( caddr (car program)))
        ;let the statement be intepret-statement's problem, cddr lets you interpret the line starting at the statement 
        (interpet-statement (car (cddr (car program))))
    )
)    

;interpret statement base function to determine what kind of statement the arguement is, passes the arguement to the appropriate intepret function for its given statement
(define (interpret-statement statement)
    ;isolate whatever operation the statement wants us to do, ie. let, if, print, etc... and jump to the appropriate interpret function
    (define operation (car statement))
    (if (eqv? operation "dim")
        (interpret-dim statement)
    )
    (if (eqv? operation "let")
        (interpret-let statement)
    )
    (if (eqv? operation "goto")
        (interpret-goto statement)
    )
    (if (eqv? operation "if")
        (interpret-if statement)
    )
    (if (eqv? operation "print")
        (interpret-print statement)
    )
    (if (eqv? operation "input")
        (interpret-input statement)
    )
)

;specific interpret-statement functions

(define (interpret-dim statement)

)

(define (interpret-let statement)

)

(define (interpret-goto statement)

)

(define (interpret-if statement)

)

(define (interpret-print statement)

)

(define (interpret-input statement)

)

;expression interpretors, called  by the interpret statement functions

   

(printf "terminal-port? *stdin* = ~s~n" (terminal-port? *stdin*))
(if (terminal-port? *stdin*)
    (main (vector->list (current-command-line-arguments)))
    (printf "sbi.scm: interactive mode~n"))
