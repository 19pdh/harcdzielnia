#!/bin/sh

mkdir -p dest

cp logo-* style.css dest

cat _index_header.html > dest/index.html
for f in $(find itemy -name '*.md'); do
  file=$(basename $f .md)
  title=$(grep '^# ' $f | head -n 1 | cut -c 3-)
  echo "<li><a href=\"$file.html\">$title</a></li>" >> dest/index.html
  cat _header.html > dest/$file.html
  sed 's/^# \(.*\)/<h2>\1<\/h2>/' $f >> dest/$file.html
  echo "</div></main>
 <footer>
  <hr>
  <a href=\"https://zhr.niedzwiedzinski.cyou/harcdzielnia\">Harcdzielnia</a> |
  <a href=\"https://git.niedzwiedzinski.cyou/zhr/harcdzielnia\">Współtwórz harcdzielnię</a>
</footer>
 </body></html>" >> dest/$file.html
done

echo "</ul></main>
<footer>
  <hr>
  <a href=\"https://zhr.niedzwiedzinski.cyou/harcdzielnia\">Harcdzielnia</a> |
  <a href=\"https://git.niedzwiedzinski.cyou/zhr/harcdzielnia\">Współtwórz harcdzielnię</a>
</footer>
</body></html>" >> dest/index.html
