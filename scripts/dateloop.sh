for count in {0..50}
do
	echo $count
	cp "Programming Meeting 01182022.docx" "Programming Meeting 01$count2022.docx"
done

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