echo "Sh file Working"
yq e '.dirs' coverignore.yaml
echo $1
export FILES_CHANGED="'$(echo $1 | tr [:blank:] "|")'"
(grep -E $FILES_CHANGED ff.txt || true) > fg.txt
cat fg.txt