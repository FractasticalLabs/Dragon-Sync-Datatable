# Update script for all Dragon-Breath components, stored locally as separate git repositories

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Removing previous files"
rm -r $DIR/src/*
echo "Updating all submodules"
# Not sure that this line is necessary
git submodule update

while read sm    
do    
	echo "updating from $sm"
	cd submodules/$sm
	git checkout master
	git pull

	cp -R *.cls $DIR/src/classes
	cp -R *.resource $DIR/src/resources
	cp -R *.component $DIR/src/component
	cp -R *.page $DIR/src/pages

	cd $DIR
done <SUBMODPATHS
ruby gen_meta.rb


