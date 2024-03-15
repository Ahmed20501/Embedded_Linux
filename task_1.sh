#!/bin/bash

<<comment
 this task for create bash script that arrange the content of certain directory depends on 
 the extensions of the included files and creates subdirectory for each type
comment

Dir=$1
if [ "$#" -ne 1 ];then
    echo "few argus"
    exit 1  
elif [ ! -d "$Dir" ] ; then
    echo "Directory $Dir does not exist."
    exit 1

fi

cd "$Dir" || exit 5
echo "Working in directory $(pwd)..."

for file in "$Dir"/*;do
  if [ -f "$file" ];then
        ext="${file##*.}"
        ext="${ext#.}"
    case "$ext" in
            txt) if [ ! -d "$Dir"/txt ] ; then mkdir "$Dir"/txt ; fi
                 mv "$file" "$Dir"/txt ;;
            jpg) if [ ! -d "$Dir"/jpg ] ; then mkdir "$Dir"/jpg ; fi
                 mv "$file" "$Dir"/jpg ;;
            pdf) if [ ! -d "$Dir"/pdf ] ; then mkdir "$Dir"/pdf ; fi
                 mv "$file" "$Dir"/dpf ;;
            misc) if [ ! -d "$Dir"/misc ] ; then mkdir "$Dir"/misc ; fi
                 mv "$file" "$Dir"/misc ;; 
     esac
   fi
 done  
 echo " Files organized successfully. "               

