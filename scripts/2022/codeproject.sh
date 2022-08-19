# TODO: Parse title of blog

declare -A article
article["Author"]="Sam Weddington"
article["Email"]="abakasam@outlook.com"
article["License"]="MIT"

file="/home/cabox/workspace/abakasam/blog/06102022-abakasam-blog"

while read line
do
	IFS=" "; read -ra part <<< "$line"
	
	article["Title"]=${part[0]}
	article["Description"]=${part[2]}
	article["Abstract"]=${part[@]:9}
	article["Language"]=${part[1]}
	article["Platform"]=${part[3]}
	article["Technology"]=${part[4]}
	article["Topic"]=${part[5]}
	article["Subtopic"]=${part[6]}
	article["Subsection"]=${part[8]}
	article["Type"]=${part[7]}
		
	break
done < $file

for part in "${article[@]}"
do
	echo $part
done

# TODO: Enter into CodeProject template
# TODO: Email to CodeProject
