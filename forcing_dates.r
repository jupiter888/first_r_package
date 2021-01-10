#' Read dates from filename
#' Foricng used to read filenames dates
#'
#'@param all.files
#'@return Posix Date from filename using forcing
#'@export forcing_dates
#'@examples
forcing_dates <- function(all.files) {
  dates.data<-strsplit(substr(all.files,start=nchar(all.files)-27,stop=nchar(all.files)-3), '-')
  date.id<-data.table(date=seq(as.POSIXct(dates[[1]][1],format="%Y%m%d%H%M"),
                               as.POSIXct(dates[[1]][2],format="%Y%m%d%H%M"),by='hour'),
                      forcing=sapply(strsplit(substr(fls[i],start=1, stop=n-29),split="-")))
}
