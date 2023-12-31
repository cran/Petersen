% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{data_btspas_nondiag1}
\alias{data_btspas_nondiag1}
\title{Estimating abundance of salmon - BTSPAS - non-diagonal case}
\format{
\subsection{\code{data_btspas_nondiag1}}{

A data frame with many rows and 3 columns

\describe{
\item{\code{cap_hist}.}{Capture history of the form `week1..week2' for fish that are released on
week 1 and recaptured
on week 2 ; '0..week22' for unmarked fish newly captured in week 2; 'week1..0' for fish
released in week 1 but never recaptured.}
\item{\code{freq}.}{Number of fish with this history.}
}
}
}
\usage{
data(data_btspas_nondiag1)
}
\description{
This is the first non-diagonal case dataset from BTSPAS.
}
\details{
Incoming sockeye salmon are captured on a first wheel, tagged with color tags
that vary by week, and recaptured on an upriver weir.
The upriver weir was not in operation for the first few weeks.
}
\keyword{datasets}
