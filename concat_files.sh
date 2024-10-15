#!/bin/bash

#help -h messages
show_help() {
echo "To use, ./concat_files.sh [options] <output_file> <input files>"
echo ""
echo "This script concatenates, or merges, various text files together into a single file"
echo ""
echo "Options: "
echo " -h : shows this message"
echo " -f : filters the the lines based on regex pattern"
}

#Handle invalid arguments with an appropriate error message
if [ $# -eq 0 ]; then
    echo "No arguments provided"
    show_help
    exit 1
fi 

filter=""
output_file=""

#analyze options
while getopts "hf:" opt; do
  case $opt in
    h)
      show_help
      exit 0
      ;;
    f)
      filter=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      show_help
      exit 1
      ;;
  esac
done

shift $((OPTIND - 1))

#verify there are enough arguments (output file & at least one input file)
if [ $# -lt 2 ]; then
  echo "Error: Output file and at least one input file required."
  show_help
  exit 1
fi

#output file and input files
output_file="$1"
shift
input_files=("$@")

#Check if input files exist
for file in "${input_files[@]}"; do
  if [ ! -f "$file" ]; then
    echo "Error: File '$file' not found."
    exit 1
  fi
done

#Concatenate the input files
echo "Concatenating files into '$output_file'..."
> "$output_file"  # Create or clear the output file

for file in "${input_files[@]}"; do
  if [ -z "$filter" ]; then
    #If no pattern provided, append entire content
    cat "$file" >> "$output_file"
  else
    #If pattern is provided, filter and append matching lines
    grep -E "$filter" "$file" >> "$output_file"
  fi
done

echo "Concatenation merge completed successfully."