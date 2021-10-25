# FacultyPublishing
This code supports data cleaning and visualization of citation data from Web of Science for the purposes of better understanding institutional publishing patterns. The full project is presented at Southeastern Library Assessment Conference 2020.

## Files:
* WoS-combine.R
* WoS-download.R
* WoS-normalize.R
* WoS-visualize.R

## Workflow:
1. Search and download one year's worth of data from Web of Science Core Collection using the organization enhanced search
  * OG=(North Carolina State University) AND PY=(2020)
  * Download full records for every result as either Excel or csv format (csv format preferred)
  * If you have to download multiple files, download them with the default naming convention and save them in a file labeled "data" in the project directory
2. Use the WoS-download.R file to combine multiple record downloads into one complete file.
  * the "save compiled file" section needs to have the file name updated to reflect the year of the data downloaded
  * Once you are done, move the download files to a new folder in the project directory, so you can grab them if you need to, but next year you won't give yourself a headache if you just dump the new files in data
3. Use the WoS-normalize.R file to create set publisher names to be used for analysis and visualization
  * updating the publisher names would require you to re-run all of the files to be used in the analysis
  * Set the fileIn object to the name of the file to be read in
  * Set the fileOut object to the name of the file to be saved out
4. In WoS-combine.R, combine the years of data you want to analyze into one dataset for easier visualization
  * The new year of data will need to be added to every section of the script following the conventions of the previous years
  * This file will save a "complete" dataset for all years called "Publications.csv" If you do not want to overwrite the previous year's dataset, rename or move if from the "data" folder
5. Use WoS-visualize.R to make a number of basic visualizations, and customize the code to create alternate views
  * this script starts with the full, multi-year citation data file created at the end of WoS-combine.R which should be "data/Publications.csv"
  * this script will generate but not save plots
