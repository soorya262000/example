echo "Sh file Working"
yq e '.dirs' coverignore.yaml
echo $1
for added_modified_file in $1; do
    echo "Do something with this ${added_modified_file}."
done
export FILES_CHANGED="'$(echo $1 | tr [:blank:] "|")'"
echo $FILES_CHANGED
grep $1 coverreport.text
for added_modified_file in "$1"; do
    echo "Do something with this ${added_modified_file}."
    (grep $added_modified_file coverreport.text || true) >> gh.txt
done
echo "CHanged"
cat gh.txt
grep -E "$FILES_CHANGED"