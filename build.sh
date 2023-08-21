#!/bin/sh

mkdir -p dest/foty

cp static/* dest

cat _index_header.html > dest/index.html

function generate_page() {
	filename=$(basename $1)
	cat _header.html > dest/$filename.html
	sed 's/^# \(.*\)/<h2>\1<\/h2>/' $1/opis.md >> dest/$filename.html
	cat _footer.html >> dest/$filename.html

}

function generate_index() {
	echo "<div class=\"container\">"
	for item in `find $1 -name opis.md`; do
		category=$(basename $(dirname $(dirname $item)))
		dir=$(dirname $item)
		generate_page $dir
		filename=$(basename $dir)
		name=$(head -n1 $item | cut -c 2-)
		echo "<div class=\"item\"><a href=\"$filename.html\">"
		cp $dir/fota.jpg dest/foty/$filename.jpg
		echo "<img class=\"fota\" src=\"foty/$filename.jpg\">"
		echo "<div class=\"name\">"
		echo "<img class=\"icon\" src=\"$category.png\">"
		echo "<p>$name</p>"
		echo "</div></a></div>"
	done
	echo "</div>"
}

for kategoria in `ls itemy`; do
	cat _header.html > dest/$kategoria.html
	generate_index itemy/$kategoria >> dest/$kategoria.html
	cat _footer.html >> dest/$kategoria.html
done

generate_index itemy >> dest/index.html
cat _footer.html >> dest/index.html
