#!/bin/bash
echo "Threadin'"
echo

COUNTER=0
for THREAD in {1..20}; do
  echo "This is thread $THREAD, sleeping for 2 seconds"
  sleep 2 &
  ((COUNTER=COUNTER+1))
  if [[ $((COUNTER % 4)) == 0 ]]; then
    echo "waiting for 4 to complete to spawn new threads"
    echo
    wait
  fi
done

echo "All done"
