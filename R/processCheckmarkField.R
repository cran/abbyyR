#' processCheckmarkField
#'
#' @description Processes Checkmark Field
#' 
#' @param file_path required, path of the document, default: ""
#' @param checkmarkType optional, default: "empty"
#' @param region coordinates of region from top left, 4 values: top left bottom right; optional; default: "-1,-1,-1,-1" (entire image) 
#' @param correctionAllowed  optional, default: "false"
#' @param pdfPassword  optional, default: ""
#' @param description  optional, default: ""
#' @param \dots Additional arguments passed to \code{\link{abbyy_POST}}.
#' 
#' @return Data frame with details of the task associated with the submitted Image
#' @export
#' 
#' @references \url{http://ocrsdk.com/documentation/apireference/processCheckmarkField/}
#' @references For supported image types, see \url{http://ocrsdk.com/documentation/specifications/image-formats/}
#' 
#' @examples \dontrun{
#' processCheckmarkField(file_path = "file_path")
#' }

processCheckmarkField <- function(file_path = "",
                                  checkmarkType = "empty",
                                  region = "-1,-1,-1,-1",
                                  correctionAllowed = "false",
                                  pdfPassword = "", description = "", ...) {

  if (!file.exists(file_path)) {
    stop("File Doesn't Exist. Please check the path.")
  }

  querylist <- list(checkmarkType = checkmarkType,
                    region = region,
                    correctionAllowed = correctionAllowed,
                    pdfPassword = pdfPassword,
                    description = description)

  body <- upload_file(file_path)
  process_details <- abbyy_POST("processCheckmarkField",
                                query = querylist,
                                body = body, ...)

  # collapse to a data.frame
  resdf <- ldply(process_details, rbind, .id = NULL)
  row.names(resdf) <- NULL
  resdf[] <- lapply(resdf, as.character)

  # Print some important things
  cat("Status of the task: ", resdf$status, "\n")
  cat("Task ID: ",       resdf$id, "\n")

  resdf
}
