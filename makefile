MAINFILE=test
BUILD_DIR=tmp/release
DEBUG_BUILD_DIR=tmp/debug
ifndef VERBOSE
.SILENT:
endif

all:	${MAINFILE}.tex
	echo "Rendering ${MAINFILE}"
	latexmk -lualatex -interaction=nonstopmode \
		-logfilewarnings- -quiet \
		-outdir=${BUILD_DIR} \
		-auxdir=${BUILD_DIR} \
		${MAINFILE}.tex > /dev/null 2> /dev/null
	cp ${BUILD_DIR}/${MAINFILE}.pdf ${MAINFILE}.pdf
	echo "${MAINFILE} Rendered..."

debug:	${MAINFILE}.tex
	echo "Rendering ${MAINFILE}..."
	latexmk -lualatex -interaction=nonstopmode \
		-logfilewarnings- -quiet -shell-escape \
		-outdir=${DEBUG_BUILD_DIR} -gg -cd \
		-auxdir=${DEBUG_BUILD_DIR} \
		${MAINFILE}.tex
	cp ${DEBUG_BUILD_DIR}/${MAINFILE}.pdf ${MAINFILE}.pdf
	echo "${MAINFILE} Rendered..."
