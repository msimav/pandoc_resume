all: html pdf docx

pdf: docs/resume.pdf
docs/resume.pdf: style_chmduquesne.tex resume.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o resume.tex resume.md; \
	context resume.tex
	mv resume.pdf docs/

html: docs/index.html
docs/index.html: style_chmduquesne.css resume.md links.md
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o docs/index.html resume.md links.md

docx: docs/resume.docx
docs/resume.docx: resume.md
	pandoc --standalone --from markdown --to docx -o docs/resume.docx resume.md


clean:
	rm -f resume.tex
	rm -f resume.tuc
	rm -f resume.log
