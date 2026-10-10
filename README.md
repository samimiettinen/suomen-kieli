# suomen-kieli

Claude-skill suomenkielisen tekstin tuottamiseen, oikolukuun, luonnollistamiseen, kääntämiseen ja arviointiin. Perustuu Kielitoimiston ohjepankin normeihin ja sisältää erikseen ohjeet tekoälytekstin tyypillisten suomen kielen virheiden (yhdyssanat, anglismit, kaavamainen tyyli) tunnistamiseen ja korjaamiseen.

A Claude skill for producing, proofreading, naturalizing, translating and reviewing Finnish text, based on the norms of the Institute for the Languages of Finland (Kotus / Kielitoimiston ohjepankki).

## Rakenne

```
SKILL.md                     ydinohje: toimintatilat, sääntöhierarkia, normisto, loppuluku
references/luetelmat.md      luetelmien muoto, alkukirjaimet ja välimerkit
references/lauseet.md        essiivi, joka/mikä, rinnastus, substantiivitauti, sanajärjestys
references/taivutus.md       vieraskieliset nimet, lyhenteet, rektiot, rinnakkaismuodot
references/merkit.md         välimerkit, päivämäärät, rahamäärät, puhelinnumerot, aakkostus
references/sanasto.md        lainasanat, käännöslainat, fraasit, yleis- ja puhekieli
```

`SKILL.md` latautuu, kun skill aktivoituu. Referenssitiedostot luetaan vain, kun teksti sitä vaatii, joten ne eivät kuormita tavallisia tehtäviä. `SKILL.md` toimii myös yksinään.

Ydinohjeessa on seitsemän vaihetta: toimintatilan määritys, sääntöhierarkia, asiasisällön suojaus, kielenhuolto esimerkkeineen, luonnollistaminen tekstilajin ehdoilla, toimintatilan mukainen vastaus ja kaksivaiheinen loppuluku (merkitysluku ja kieliluku).

## Asennus

**claude.ai / Claude-sovellus:** rakenna paketti ja lataa se kohdassa Settings → Skills.

```bash
./scripts/build.sh          # tuottaa dist/suomen-kieli.zip
```

**Claude Code:** skill on hakemisto, jossa on `SKILL.md`. Pelkkä `.md`-tiedosto suoraan `skills/`-kansiossa ei lataudu.

```bash
mkdir -p ~/.claude/skills/suomen-kieli
cp -R SKILL.md references ~/.claude/skills/suomen-kieli/
```

Projektikohtaisesti korvaa `~/.claude` polulla `.claude`.

## Lähteet

- [Kielitoimiston ohjepankki](https://kielitoimistonohjepankki.fi/)
- [Kielitoimiston sanakirja](https://www.kielitoimistonsanakirja.fi/)
- [Iso suomen kielioppi](https://kaino.kotus.fi/visk/etusivu.php)

## Lisenssi

MIT — ks. [LICENSE](LICENSE).
