echo "Sh file Working"
yq e '.dirs' coverignore.yaml
export FILES_CHANGED="'$(echo $@ | tr [:blank:] "|")'"
echo $FILES_CHANGED
cat coverreport.text
echo "Changed"
echo "mode: count\n" >> gh.txt
for added_modified_file in "$@"; do
    echo "Do something with this ${added_modified_file}."
    (grep $added_modified_file coverreport.text || true) >> gh.txt
done
echo "File Content"
cat gh.txt
go tool cover -func gh.txt