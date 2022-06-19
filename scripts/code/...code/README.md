comment (generate TODO)

./commentcode.sh js /workspace/abakasam/scripts/code TODO
./commentcode.sh [language] [working directory] [list file]

language: Bash

Developer Comment

	# TODO: message
	# TODO: message (Review)

Developer Comment Types
	1	TODO
	1a	IMPROVE	
	1b	REDO	
	2	BUG		
	2a	MEMORY	
	2b	LEGACY	

Comment Status
	1	
	2	(Complete)
	3	(Review)
	4	(Reviewed)

Console Output
	echo "message"
	
TODO file

	<filepath> <linenumber> <developer comment(comment status)>
	/workspace/abakasam/scripts/code/index.js 8 // TODO: message

map (generate TODO.map)

./mapcode.sh

Task Name and Type
	Function   (folders / executable)
	Project    (folder)              
	Assignment (file)                
	Task       (file / block)        

Fixing Filetype

	<taskname> <filetype> ?A <path>
	?A: Taskname == Filetype

see

commment Console Output

	/home/main.sh
	// TODO: Yup
	<filepath> <developer comment message>
	echo "$(pwd)/main.sh Yup"

interface

Object Oriented Programming

	<taskname>-driver.<extension>
	<taskname>-members.<extension>
	<taskname>-object.<extension>
