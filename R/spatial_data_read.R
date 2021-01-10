#' Spatial Data Processing
#'
#' @param dir Directory containing .nc files
#' @param ext Area extension
#'
#' @return dataset with pr data and cells id cols
#' @export
#'
#' @examples
spatial_data_read<-function(dir, ext){
    nc<-nc_open(dir)
    #pr
    err<-try(expr={p<-ncvar_get(nc, varid='pr')}, silent=TRUE)
    if(inherits(err, what='try-error')){
      err<-try(expr={p<-ncvar_get(nc, varid = 'precipitation_flux')}, silent = TRUE)
    }

    #lon
    err<-try(expr = {lon <- ncvar_get(nc, varid = 'lon')}, silent = TRUE)
    if (inherits(err, what = 'try-error')) {
      err<-try(expr = {lon <- ncvar_get(nc, varid = 'longitude')}, silent = TRUE)
    }

    #lat
    err<-try(expr = {lat <- ncvar_get(nc, varid = 'lat')}, silent = TRUE)
    if(inherits(err, what = 'try-error')) {
      err<-try(expr = {lat <- ncvar_get(nc, varid = 'latitude')}, silent = TRUE)
    }

    #Creating a dt from raster
    rast<-brick(p)
    extent(rast)<-c(range(lon), range(lat))
    aux<-as.data.table(t(extract(rast, ext)))
    names(aux)<-as.character(cellsFromExtent(rast, ext))
    return(aux)
  }
