#' Delta and Historical DDF Calculation
#'
#' @param ddf.data Dataset processed with historical RCP
#'
#' @return A dataset prepared for plotting,containing all the data
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
  #Beautifying
  DDDF[, 5:=NULL]
  setnames(DDDF, 'i.RCP', 'RCP')
  return(DDDF)
}
