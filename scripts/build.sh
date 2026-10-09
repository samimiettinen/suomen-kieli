#!/usr/bin/env bash
# Rakentaa ladattavan skill-paketin: dist/suomen-kieli.zip
# Tarkistaa ensin, että jokainen SKILL.md:ssä mainittu references-tiedosto on olemassa
# ja että jokainen references-tiedosto on mainittu SKILL.md:ssä.
set -euo pipefail

cd "$(dirname "$0")/.."
name="suomen-kieli"

head -1 SKILL.md | grep -qx -- '---' || { echo "SKILL.md: frontmatter puuttuu" >&2; exit 1; }
grep -q "^name: ${name}$" SKILL.md || { echo "SKILL.md: name ei ole ${name}" >&2; exit 1; }

status=0
for ref in $(grep -o 'references/[a-z-]*\.md' SKILL.md | sort -u); do
  [ -f "$ref" ] || { echo "Puuttuva tiedosto: $ref" >&2; status=1; }
done
for f in references/*.md; do
  grep -q "$f" SKILL.md || { echo "Tiedostoa ei mainita SKILL.md:ssä: $f" >&2; status=1; }
done
[ "$status" -eq 0 ] || exit 1

rm -rf dist
mkdir -p "dist/${name}"
cp -R SKILL.md references "dist/${name}/"
(cd dist && zip -qr "${name}.zip" "${name}")
rm -rf "dist/${name}"
echo "Valmis: dist/${name}.zip"
