echo "Sh file Working"
yq e '.dirs' coverignore.yaml
echo $1
export FILES_CHANGED="'$(echo $1 | tr [:blank:] "|")'"
echo $FILES_CHANGED
cat coverreport.text
grep $FILES_CHANGED coverreport.text