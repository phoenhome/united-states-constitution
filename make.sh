#!/usr/bin/env bash

# NOTE: Do not edit these **generated** files.
export CONSTITUTION_PDF="./United States Constitution.pdf"
export CONSTITUTION_MD="./United States Constitution.md"
export ARTICLE_1="./01_article1/article1.md"
export ARTICLE_2="./02_article2/article2.md"
export ARTICLE_3="./03_article3/article3.md"
export ARTICLE_4="./04_article4/article4.md"
export AMENDMENTS="./08_amendments/amendments.md"

echo "📜 United States Constitution"

echo "🧹 Removing previously generated documents..."
rm -f "$CONSTITUTION_PDF"
echo $CONSTITUTION_PDF
rm -f "$CONSTITUTION_MD"
echo $CONSTITUTION_MD
rm -f "$ARTICLE_1"
echo $ARTICLE_1
rm -f "$ARTICLE_2"
echo $ARTICLE_2
rm -f "$ARTICLE_3"
echo $ARTICLE_3
rm -f "$ARTICLE_4"
echo $ARTICLE_4
rm -f "$AMENDMENTS"
echo $AMENDMENTS

echo "📝 Generating PDF document..."
pandoc $(find . | grep .md | grep -v -e *.pdf -e README.md -e CONTRIBUTING.md -e CHANGELOG.md -e tmp | sort) -f markdown --pdf-engine xelatex -o "$CONSTITUTION_PDF"
echo $CONSTITUTION_PDF

echo "🪢 Concatenating single-page Markdown documents..."
ls -1 0*/*.md | sort | xargs -I '{}' cat '{}' > "$CONSTITUTION_MD"
echo $CONSTITUTION_MD
ls -1 ./01_article1/*.md | sort | xargs -I '{}' cat '{}' > "$ARTICLE_1"
echo $ARTICLE_1
ls -1 ./02_article2/*.md | sort | xargs -I '{}' cat '{}' > "$ARTICLE_2"
echo $ARTICLE_2
ls -1 ./03_article3/*.md | sort | xargs -I '{}' cat '{}' > "$ARTICLE_3"
echo $ARTICLE_3
ls -1 ./04_article4/*.md | sort | xargs -I '{}' cat '{}' > "$ARTICLE_4"
echo $ARTICLE_4
ls -1 ./08_amendments/*.md | sort | xargs -I '{}' cat '{}' > "$AMENDMENTS"
echo $AMENDMENTS

echo "✅ Finished"
