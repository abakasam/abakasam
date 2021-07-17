source my.config

nodeversion="v0.12.18"

#TODO: Check if file already exist
#wget https://nodejs.org/dist/latest-v0.12.x/node-v0.12.18.tar.gz
#tar -xf node-v0.12.18.tar.gz

package="python"
#apt-get install --download-only --assume-yes $package
#cd $directoryuser
#mkdir $package
#mv /var/cache/apt/archives/*.deb $directoryuser"/"$package

output=$(ls python)
files=""
IFS=" " read -a files <<< $output
cd $directoryuser"/"$package
echo ${files[0]}
apt-get install ./${files[0]} --assume-yes