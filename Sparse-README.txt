
  sparse (spärs), adj,., spars-er, spars-est.
	1. thinly scattered or distributed; "a sparse population"
	2. thin; not thick or dense: "sparse hair"
	3. scanty; meager.
	4. semantic parse
  	[ from Latin: spars(us) scattered, past participle of
	  spargere 'to sparge' ]

	Antonym: abundant

Sparse is a semantic parser of source files: it's neither a compiler
(although it could be used as a front-end for one) nor is it a
preprocessor (although it contains as a part of it a preprocessing
phase). 

It is meant to be a small - and simple - library.  Scanty and meager,
and partly because of that easy to use.  It has one mission in life:
create a semantic parse tree for some arbitrary user for further
analysis.  It's not a tokenizer, nor is it some generic context-free
parser.  In fact, context (semantics) is what it's all about - figuring
out not just what the grouping of tokens are, but what the _types_ are
that the grouping implies.

And no, it doesn't use lex and yacc (or flex and bison).  In my personal
opinion, the result of using lex/yacc tends to end up just having to
fight the assumptions the tools make. 

The parsing is done in five phases:

 - full-file tokenization
 - pre-processing (which can cause another tokenization phase of another
   file)
 - semantic parsing.
 - lazy type evaluation
 - inline function expansion and tree simplification

Note the "full file" part. Partly for efficiency, but mostly for ease of
use, there are no "partial results". The library completely parses one
whole source file, and builds up the _complete_ parse tree in memory.

Also note the "lazy" in the type evaluation.  The semantic parsing
itself will know which symbols are typedefines (required for parsing C
correctly), but it will not have calculated what the details of the
different types are.  That will be done only on demand, as the back-end
requires the information. 

This means that a user of the library will literally just need to do

  struct string_list *filelist = NULL;
  char *file;

  action(sparse_initialize(argc, argv, filelist));

  FOR_EACH_PTR_NOTAG(filelist, file) {
    action(sparse(file));
  } END_FOR_EACH_PTR_NOTAG(file);

and he is now done - having a full C parse of the file he opened.  The
library doesn't need any more setup, and once done does not impose any
more requirements.  The user is free to do whatever he wants with the
parse tree that got built up, and needs not worry about the library ever
again.  There is no extra state, there are no parser callbacks, there is
only the parse tree that is described by the header files. The action
funtion takes a pointer to a symbol_list and does whatever it likes with it.

The library also contains (as an example user) a few clients that do the
preprocessing, parsing and type evaluation and just print out the
results.  These clients were done to verify and debug the library, and
also as trivial examples of what you can do with the parse tree once it
is formed, so that users can see how the tree is organized. 
