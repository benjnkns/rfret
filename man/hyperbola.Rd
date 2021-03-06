% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/equations.R
\name{hyperbola}
\alias{hyperbola}
\title{Michaelis-Menten equation}
\usage{
hyperbola(titrated_conc, kd, n, signal_min, signal_max, probe_conc)
}
\arguments{
\item{titrated_conc}{Concentrations in the titration series.}

\item{kd}{Binding constant.}

\item{n}{Hill coefficient.}

\item{signal_min}{Minimal observed signal.}

\item{signal_max}{Maximal observed signal.}

\item{probe_conc}{Fixed concentration of probe.}
}
\description{
This function sets up the Michaelis-Menten equation for use by
    \code{\link{fit_binding_model}} or \code{\link[stats]{nls}}.
}
