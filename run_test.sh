echo "Sh file Working"
yq e '.dirs' coverignore.yaml
echo $1
export FILES_CHANGED="'$(echo $1 | tr [:blank:] "|")'"
echo $FILES_CHANGED
grep $1 coverreport.text
echo "CHanged"
grep -E $FILES_CHANGED