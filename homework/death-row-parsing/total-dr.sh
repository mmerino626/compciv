bash tx-dr.sh | sed 's/Native....American/Other/' | sed 's/^/TX,/'
bash fl-dr.sh | sed 's/B/Black/' | sed 's/H/Hispanic/' | sed 's/W/White/' | sed 's/O/Other/' | tr -d  'M' | tr -d 'F' | sed 's/^/FL,/'
bash ca-dr.sh | sed 's/BLA/Black/' | sed 's/HIS/Hispanic/' | sed 's/WHI/White/' | sed 's/OTH/Other/' | sed 's/^/CA,/'
