#!/bin/bash

# Start time
Start=$(date "+%s")

# Default compression level
Compression_Level=1

# Check if the user entered 2 arguments
if [ "$#" -ne 2 ] && [ "$#" -ne 4 ]; then
    echo "Usage: $0 <Source Path> <Destination Path> [-c <Compression Level>]"
    exit 1
fi

# Check if the optional argument is entered
if [ "$#" -eq 4 ] && [ "$3" == "-c" ]; then
    Compression_Level=$4
fi

# Assign command line arguments
Source_Path=$1
Destination_Path=$2

# Check if source directory exists
if [ ! -d $Source_Path ]; then
    echo "Source directory does not exist!"
    echo "$(date "+%Y-%m-%d %H:%M:%S") - Source directory does not exist." >> $Log_File
    exit 1
fi

# Check if destination directory exists
# create if it doesn't
if [ ! -d $Destination_Path ]; then
    echo "Destination directory does not exist. Creating..."
    mkdir -p $Destination_Path
fi

# Create the log file path
Log_File="$Destination_Path/backup_log.txt"

# Zip all files in the source directory
Zip_File="$Destination_Path/$(date "+%Y-%m-%d")-$(basename $Source_Path).zip"
Zip_Command="zip -$Compression_Level -r $Zip_File $Source_Path"
echo "Zipping files from $Source_Path to $Zip_File..."
$Zip_Command
#$Zip_Command >> $Log_File 2>&1

# Check if zip command was successful
if [ $? -eq 0 ]; then
    echo "Backup of $Source_Path completed successfully."
    echo "Saved to $Zip_File"
else
    echo "Failed to create backup."
    echo "$(date "+%Y-%m-%d %H:%M:%S") - Failed to create backup." >> $Log_File
fi

# End time
End=$(date "+%s")
# Duration time
Duration=$((end_time - start_time))

# Create a log file with timestamp
echo "*** Backup Log Report ***" >> $Log_File
echo "" >> $Log_File
echo "Date: $(date "+%Y-%m-%d")" >> $Log_File
echo "Time: $(date -d @$Start "+%H:%M:%S")" >> $Log_File
echo "" >> $Log_File
echo "** Machine Information **" >> $Log_File
echo "" >> $Log_File
echo "Operating System: $(uname -a)" >> $Log_File
echo "" >> $Log_File
echo "** Backup Details **" >> $Log_File
echo "" >> $Log_File
echo "Source Path: $Source_Path" >> $Log_File
echo "Destination Path: $Destination_Path" >> $Log_File
echo "Compression Level: $Compression_Level" >> $Log_File
echo "Files Backed Up: $(find $Source_Path -type f | wc -l)" >> $Log_File
echo "Directories Backed Up: $(find $Source_Path -mindepth 1 -type d | wc -l)" >> $Log_File
echo "" >> $Log_File
echo "** Backup Summary **" >> $Log_File
echo "" >> $Log_File
echo "Start Time: $(date -d @$Start "+%H:%M:%S")" >> $Log_File
echo "End Time: $(date -d @$End "+%H:%M:%S")" >> $Log_File
echo "Duration Time: $(date -u -d @$Duration "+%H:%M:%S")" >> $Log_File
