% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/complex_functions.R
\name{compare_to_catalogues}
\alias{compare_to_catalogues}
\title{Compare one mutational catalogue to reference mutational catalogues}
\usage{
compare_to_catalogues(in_index_df, in_comparison_list)
}
\arguments{
\item{in_index_df}{Data frame containing the mutational catalogue of interest}

\item{in_comparison_list}{List of data frames (ideally named) containing the reference mutational
catalogues}
}
\value{
A similarity dataframe
}
\description{
Compare one mutational catalogue (e.g. of one index patient) to a list of
reference mutational catalogues (e.g. from the initial Alexandrov
puplication) by cosine similarities
}
\examples{
 NULL

}

