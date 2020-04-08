# Open a dmenu with yes or no to confirm the selected action

if [ $(echo "no\nyes" | dmenu  -fn "iosevka-regular" -nb '#32302f' -nf '#ebdbb2' -sb '#8f3f71' -sf '#ebdbb2' -p "$1") = "Yes" ]; then
	$2
fi
