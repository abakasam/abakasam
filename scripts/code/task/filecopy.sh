# TODO: Define file and mark

file="Programming Meeting 01182022"
extension=".docx"
mark=""

# TODO: Set count for files

for count in {0..50}
do
	echo $count
	cp $file $file$mark$extension
done

# TODO: Create function to date for file

datestamp() {
	document="Programming Meeting 01182022.docx"

	year="2022"
	month="01"
	day="18"

	date="Tue $year-$month-$day 00:00:00 EST 2022"

	target="Tue Jun 14 00:00:00 EST 2022"

	while [[ $date != $target ]]
	do
		date=$(date --date "$date +7day")
		echo $date
	done
}