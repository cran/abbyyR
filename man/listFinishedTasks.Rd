% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/listFinishedTasks.R
\name{listFinishedTasks}
\alias{listFinishedTasks}
\title{List Finished Tasks}
\usage{
listFinishedTasks(...)
}
\arguments{
\item{\dots}{Additional arguments passed to \code{\link{abbyy_GET}}.}
}
\value{
A \code{data.frame} with the following columns: id (task id), registrationTime, statusChangeTime, 
status (Completed), filesCount (No. of files), credits, resultUrl (URL for the processed file)
}
\description{
List all the finished tasks in the application. 

The tasks are ordered by the time of the end of processing. 
No more than 100 tasks can be returned at one method call. 
The function prints number of finished tasks by default.
}
\examples{
\dontrun{
listFinishedTasks()
}
}
\references{
\url{http://ocrsdk.com/documentation/apireference/listFinishedTasks/}
}
