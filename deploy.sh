#!/bin/sh

mkdir -p dest

cp logo-* style.css dest

cat _index_header.html > dest/index.html
for f in $(find itemy -name '*.md'); do
  file=$(basename $f .md)
  cp itemy/$file.jpg dest/$file.jpg
  title=$(grep '^# ' $f | head -n 1 | cut -c 3-)
  echo "<li><a href=\"$file.html\">$title</a></li>" >> dest/index.html
  cat _header.html > dest/$file.html
  sed 's/^# \(.*\)/<h2>\1<\/h2>/' $f >> dest/$file.html
  echo "</main>
 <footer>
  <hr>
  <a href=\"https://zhr.niedzwiedzinski.cyou/harcdzielnia\">Harcdzielnia</a> |
  <a href=\"https://git.niedzwiedzinski.cyou/zhr/harcdzielnia\">Współtwórz harcdzielnię</a>
</footer>
 </body></html>" >> dest/$file.html
done

echo "</ul></main>
<footer>
  <a href=\"https://siedemgor.pl/pl/p/Bluza-mundurowa-meska-ZHR-rozmiarowka/113#box_description\">Rozmiary mundurów</a>
  <hr>
  <div style=\"text-align: center\">
  <a href=\"https://harcdzielnia.19pdh.pl\">Harcdzielnia</a> |
  <a href=\"https://git.niedzwiedzinski.cyou/zhr/harcdzielnia\">Współtwórz harcdzielnię</a>
  <p><a href=\"https://19pdh.pl\">19 Poznańska Drużyna Harcerzy \"Puszcza\"</a></p>
  </div>
</footer>
</body></html>" >> dest/index.html
