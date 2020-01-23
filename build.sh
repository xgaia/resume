#! /bin/bash

# This script check every seconds id the markdon file is modified.
# If yes, the html file is rebuilt

mdfile="index.md"
cssfile="style.css"
htmlfile="index.html"
pdffile="resume.pdf"
title="Xavier Garnier"

function usage() {
    echo "Usage: $0 (-d { dev | prod })"
    echo "    -d     deployment mode (default: production)"
}

while getopts "hd:" option; do
    case $option in
        h)
            usage
            exit 0
        ;;

        d)
            depmode=$OPTARG
        ;;
    esac
done

case $depmode in
    prod|production|"")
        depmode="prod"
    ;;
    dev|development)
        depmode="dev"
    ;;
    *)
        echo "-d $depmode: wrong deployment mode"
        usage
        exit 1
esac

if [[ $depmode == "dev" ]]; then
    # First, build html
    echo "build html ..."
    pandoc --metadata title="${title}" --standalone -c ${cssfile} --from markdown --to html -o ${htmlfile} ${mdfile}
    echo "Done"

    # Get md5sum
    md5=$(md5sum ${mdfile} | cut -d " " -f1)

    while true ;do
        # recompute md5
        newmd5=$(md5sum ${mdfile} | cut -d " " -f1)

        if [[ "$newmd5" != "$md5" ]]; then
            echo "${mdfile} change, re-build html ..."
            # build html
            pandoc --metadata title="${title}" --standalone -c ${cssfile} --from markdown --to html -o ${htmlfile} ${mdfile}
            echo "Done"
        fi

        md5=$(md5sum ${mdfile} | cut -d " " -f1)
        sleep 1s
    done
fi


if [[ $depmode == "prod" ]]; then
    echo "Build HTML, docx and pdf..."
    pandoc --metadata title="${title}" --standalone -c ${cssfile} --from markdown --to html -o ${htmlfile} ${mdfile}
    wkhtmltopdf ${htmlfile} ${pdffile}
    echo "Done"
fi

