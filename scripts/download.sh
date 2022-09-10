
work_dir=$(cd $(dirname $0); pwd)
cd $work_dir

soft_dir="/mc/softs/"

paper_url="https://api.papermc.io/v2/projects/paper/versions/1.19.2/builds/138/downloads/paper-1.19.2-138.jar"
bc_url="http://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar"
plugin_urls=(
"https://www.spigotmc.org/resources/console-spam-fix.18410/download?version=431238"
"https://www.spigotmc.org/resources/multiverse-core.390/download?version=420035"
"https://www.spigotmc.org/resources/antiseedcracker-1-15-1-16-x.81495/download?version=344348"
"https://www.spigotmc.org/resources/banitem-1-7-1-19.67701/download?version=460610"
"https://www.spigotmc.org/resources/betterrtp-random-wild-teleport.36081/download?version=456513"
"https://www.spigotmc.org/resources/blocklocker.3268/download?version=462974"
"https://www.spigotmc.org/resources/bossshoppro-the-most-powerful-chest-gui-shop-menu-plugin.222/download?version=341124"
"https://www.spigotmc.org/resources/calendar-events.35536/download?version=370324"
"https://www.spigotmc.org/resources/chestsort-api.59773/download?version=459679"
"https://www.spigotmc.org/resources/cmilib.87610/download?version=468618"
)
function down_file(){
	local url=$1
	local base_dir=$2
	local file=$3
	cd $base_dir
	echo "start download $file"
	if [ -z $file ] ; then 
		curl -O  $url
	else
		curl -o $file $url
	fi
}

function main(){
	down_file $paper_url  $soft_dir paper.jar
	down_file $bc_url  $soft_dir bc.jar
	for element in ${plugin_urls[@]};do
		down_file $element $soft_dir
	done
}

main 
