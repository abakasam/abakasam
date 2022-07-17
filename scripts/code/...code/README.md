## comment (generate TODO)
Add developer comment and add issues to GitHub

	./commentcode.sh --help

	Developer Comment

		<operator> <type>: <message> <status>
		# TODO: message
		# TODO: message (Review)

	Developer Comment Types
	
		1	TODO
		1a	IMPROVE	
		1b	REDO	
		2	BUG		
		2a	MEMORY	
		2b	LEGACY	

	Developer Comment Status
	
		1	
		2	(Complete)
		3	(Review)
		4	(Reviewed)

	(Reviewed) Console Output

		// TODO: Yup
		<filepath> <console output command> <developer comment message>
		echo "$(pwd)/main.sh Yup"

	TODO file

		<filepath> <linenumber> <developer comment(comment status)>
		/workspace/abakasam/scripts/code/index.js 8 // TODO: message

## map (generate NEWS)
View file structure as project for code modeling

	./mapcode.sh --help

	Task Name and Type
	
	3	Product    (folders)
	3	Function   (folders / executable)
	2	Project    (folder)              
	2	Assignment (folder / file)                
	1	Task       (file)
	0			   (developer comment)	


	Fixing Filetype

		<taskname> <filetype> ?A <path>
		?A: Taskname == Filetype

## see ((Reviewed) Console Output)
Multipath and timeline execution sequence of to debug code

## interface (Object Oriented Programming)
Build interface to model code to interpret like object
