function catf
    awk 'FNR == 1 {print "---", FILENAME, "---"} {print}' $argv
end
