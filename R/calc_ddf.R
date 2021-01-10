#' Calc_ddf
#'
#' @param ddf.data
#'
#' @return
#' @export
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
