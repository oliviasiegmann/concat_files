# concat_files
 concatenate files together

 this script is a concatenator which could help someone save time by managing and analyzing multiple text files at a time, it would be useful for merging logs, consoldating reports, or pulling info without having to manually copy and paste.

 to use, you just need to type in:  ./concat_files.sh [options] <output_file> <input files>

 this runs the script with whatever command you want, you say what name you want the output file to be, and what input files are named you want concatenated.

 an example would be: ./concat_files.sh test3.txt test1.txt test2.txt
 concatenates test1.txt and test2.txt to make test3.txt

 another example would be: ./concat_files.sh -f 'Go' test4.txt test1.txt test2.txt
 this would only include lines that match the word "Go"