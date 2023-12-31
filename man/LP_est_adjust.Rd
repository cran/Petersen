% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/LP_est_adjust.R
\name{LP_est_adjust}
\alias{LP_est_adjust}
\title{Estimate abundance after empirical adjustments for various factors.}
\usage{
LP_est_adjust(
  N_hat,
  N_hat_SE,
  conf_level = 0.95,
  tag.retention.est = 1,
  tag.retention.se = 0,
  tag.reporting.est = 1,
  tag.reporting.se = 0,
  n1.adjust.est = 1,
  n1.adjust.se = 0,
  n2.adjust.est = 1,
  n2.adjust.se = 0,
  m2.adjust.est = 1,
  m2.adjust.se = 0,
  n.sim = 10000,
  trace = FALSE
)
}
\arguments{
\item{N_hat}{Estimate of N that will be adjusted}

\item{N_hat_SE}{SE of the N_hat}

\item{conf_level}{The expected coverage for confidence intervals on N.}

\item{tag.retention.est}{Estimated tag retention probability}

\item{tag.retention.se}{Estimated SE of tag retention probability}

\item{tag.reporting.est}{Estimated tag reporting probability}

\item{tag.reporting.se}{Estimated SE of tag reporting probability}

\item{n1.adjust.est}{Adjustment to "n1". This should typically be a ratio of new n1 to old n1}

\item{n1.adjust.se}{Adjustment to "n1" uncertainty}

\item{n2.adjust.est}{Adjustment to "n2"  This should typically be a ratio of new n2 to old n2}

\item{n2.adjust.se}{Adjustment to "n2" uncertainty}

\item{m2.adjust.est}{Adjustment to "m2"  This should typically be a ratio of new m2 to old m2}

\item{m2.adjust.se}{Adjustment to "m2" uncertainty}

\item{n.sim}{Number of simulation runs to make}

\item{trace}{If trace flag is set in call when estimating functions}
}
\value{
An list object with a summary data frame and a data frame with the adjustment factors with the following objects
\strong{summary} A data frame with the adjusted abundance estimates, SE, and CI
\strong{adjustment} a data frame showing the adjustment factors applied for tag retention, tag reporting, n1 n2 or m2.
\strong{datetime} Date and time the adjustment was done
}
\description{
This will take a previous fit and return estimates of abundance after making various empirical adjustments
}
\details{
The estimate and SE are converted to a beta distribution for adjustment factors between 0 and 1 with equivalent
mean and SD as the estimate and se. The estimate and se are used in normal distribution for adjustment factors for n1, n2, and m2.
These adjustment factors are then simulated a large number of times and then multiplied together
to get the mean and sd of all adjustments applied together.
Then the abundance is simulated (on the log scale), the product taken, and
the mean, sd, ci estimated directly.
}
\examples{

data(data_rodli)
rodli.fit <- Petersen::LP_fit(data=data_rodli, p_model=~..time)
rodli.est <- Petersen::LP_est(rodli.fit)
res <- Petersen::LP_est_adjust(rodli.est$summary$N_hat, rodli.est$summary$N_hat_SE,
          tag.retention.est=.90, tag.retention.se=.05)
res$summary
}
\author{
Schwarz, C. J. \email{cschwarz.stat.sfu.ca@gmail.com}.
}
