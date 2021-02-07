cat Assets/AnyThinkAds/package.json | jq 'del(.version)' | jq '. + { "version": "sdkver" }'>>tmp
mv tmp Assets/AnyThinkAds/package.json
sed -i '' 's/sdkver/'"$1"'/'  Assets/AnyThinkAds/package.json
git add -A
git commit -m "update version"
git pull
git push
git subtree split --prefix=Assets/AnyThinkAds --branch upm
git tag $1 upm
git push origin upm --tags


