if [ ! $1 = "" ]; then                  # Check for argument $1
  check_existing=$(xxd -p $1 | grep -P '^efbbbf')
  if [ ! $check_existing = "" ]; then   # Check whether BOM already present
    printf "A BOM header has already been added."
  else                                  
    printf "Adding BOM header..."
    sed -i '1s/^/\xef\xbb\xbf/' $1 # Add missing BOM
  fi
fi
