get:
	curl -LO https://www.avoindata.fi/data/dataset/941b70c8-3bd4-4b4e-a8fb-0ae29d2647a1/resource/3c277957-9b25-403d-b160-b61fdb47002f/download/finland_addresses_2023-08-14-json.7z
	7z e finland_addresses_2023-08-14-json.7z
generate:
	ruby generate.rb | tippecanoe -f -o a.pmtiles --minimum-zoom=3 --maximum-zoom=13 \
	--base-zoom=13 --drop-densest-as-needed
