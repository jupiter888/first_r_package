#' Historical and Delta DDF Calculated
#'
#' Create a datatable with delta, of all variables
#' @param ddf.data
#'
#' @return
#' @export calc_ddf
#'
#' @examples
calc_ddf <- function(ddf.data) {
  #historical
  hDDF=ddf.data[RCP=='historical', .(Duration, Freq, hour, hDepth=Depth,GCM,RCM, Run)]
  #setnames(hDDF,'Depth', 'hDepth')
  DDF=ddf.data[RCP!='historical']
  #Difference(delta)
  DDDF=hDDF[ddf.data, on=c('Duration','Freq','hour','GCM','RCM', 'Run')]
  DDDF[,delta:=Depth/hDepth]
  return(DDDF)
}
