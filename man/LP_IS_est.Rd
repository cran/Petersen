% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/LP_IS_est.R
\name{LP_IS_est}
\alias{LP_IS_est}
\title{Estimate abundance after the LP_IS conditional likelihood fit.}
\usage{
LP_IS_est(LP_IS_fit, N_hat = ~1, conf_level = 0.95, trace = FALSE)
}
\arguments{
\item{LP_IS_fit}{A result of an LP_IS_fit() call.}

\item{N_hat}{A formula requesting which abundance estimates should be formed. The formula are
expanded against the data frame to determine which records form part of the abundance estimate.
The formula is evaluated against the \code{data} frame used in the fit using the \code{model.matrix()} function,
and each column of the model
matrix is used to form an estimate.

Some familiarity on how \code{model.matrix()} generates the model matrix of coefficients used in the expansion
is needed.
For example \code{N_hat=~1} creates a model matrix with 1 column (representing the intercept) and
so requests abundance over the entire population;
Specifying \code{N_hat=~-1+Sex} creates a model matrix with 2 columns (one for each sex) consisting of 0/1 depending
if that row of the data frame is M/F. Hence, two abundance estimates (one for each sex) is computed.
On the other hand, \code{N_hat=Sex} generates a model matrix where the first column is all 1's, and
a second column which is 0/1 depending if the row in the data frame is the "second" sex. Hence, this will
request the overall abundance (over both sexes) and the estimate of abundance for the second sex.

In addition to the variables in the \code{data} frame, special variables include \code{..EF} to allow access to the expansion
factor so you can request a "truncated" Horvitz-Thompson estimator using \code{N_hat=~-1+I(as.numeric(..EF<1000))}
to only use those animals with expansion factors less than 1000 in forming the estimate.}

\item{conf_level}{The expected coverage for confidence intervals on N.}

\item{trace}{If trace flag is set in call when estimating functions}
}
\value{
An list object with abundance estimates and other information with the following elements
\itemize{
\item \strong{summary} Data frame with abundance estimates, their SE, and CIs as requested
\item \strong{detail} List with many components, including the rawdata, model fitting information, observed and expected values, residual plot, etc
\item \strong{datetime} Date and time the estimation was done from the fit.
}
}
\description{
This will take a previous fit and return estimates of abundance.
The population abundance is estimated using
a Horvitz-Thompson type estimator and the user can request abundance
estimates for sub-sets of the population
}
\examples{

data(data_wae_is_short)
fit <- Petersen::LP_IS_fit(data=data_wae_is_short, p_model=~..time)
fit$summary
est <- LP_IS_est(fit, N_hat=~1)
est$summary
}
\author{
Schwarz, C. J. \email{cschwarz.stat.sfu.ca@gmail.com}.
}
