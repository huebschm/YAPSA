% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/LCD.R
\name{LCD_complex_cutoff}
\alias{LCD_complex_cutoff}
\alias{LCD_complex_cutoff_perPID}
\title{LCD with a signature-specific cutoff on exposures}
\usage{
LCD_complex_cutoff(in_mutation_catalogue_df, in_signatures_df,
  in_cutoff_vector = NULL, in_filename = NULL, in_method = "abs",
  in_per_sample_cutoff = 0, in_rescale = TRUE, in_sig_ind_df = NULL,
  in_cat_list = NULL)

LCD_complex_cutoff_perPID(in_mutation_catalogue_df, in_signatures_df,
  in_cutoff_vector = NULL, in_filename = NULL, in_method = "abs",
  in_rescale = TRUE, in_sig_ind_df = NULL, in_cat_list = NULL)
}
\arguments{
\item{in_mutation_catalogue_df}{A numeric data frame \code{V} with \code{n} rows and \code{m} columns, 
\code{n} being the number of features and \code{m} being the number of
samples}

\item{in_signatures_df}{A numeric data frame \code{W} with \code{n} rows and \code{l} columns,
\code{n} being the number of features and \code{l} being the number of
signatures}

\item{in_cutoff_vector}{A numeric vector of values less than 1. Signatures from within \code{W}
with an overall exposure less than the respective value in 
\code{in_cutoff_vector} will be discarded.}

\item{in_filename}{A path to generate a histogram of the signature exposures if non-NULL}

\item{in_method}{Indicate to which data the cutoff shall be applied: absolute exposures,
relative exposures}

\item{in_per_sample_cutoff}{A numeric value less than 1. Signatures from within \code{W}
with an exposure per sample less than \code{in_cutoff} will be
discarded.}

\item{in_rescale}{Boolean, if TRUE (default) the exposures are rescaled such that colSums 
over exposures match colSums over mutational catalogue}

\item{in_sig_ind_df}{Data frame of type signature_indices_df, i.e. indicating name,
function and meta-information of the signatures. Default is NULL.}

\item{in_cat_list}{List of categories for aggregation. Have to be among the column names of 
\code{in_sig_ind_df}. Default is NULL.}
}
\value{
A list with entries:
\itemize{
 \item \code{exposures}:
   The exposures \code{H}, a numeric data frame with 
   \code{l} rows and \code{m} columns, \code{l} being
   the number of signatures and \code{m} being the number
   of samples
 \item \code{norm_exposures}:
   The normalized exposures \code{H}, a numeric data frame with 
   \code{l} rows and \code{m} columns, \code{l} being
   the number of signatures and \code{m} being the number
   of samples
 \item \code{signatures}:
   The reduced signatures that have exposures bigger
   than \code{in_cutoff}
 \item \code{choice}:
   Index vector of the reduced signatures in the input
   signatures
 \item \code{order}: Order vector of the signatures by exposure
 \item \code{residual_catalogue}:
   Numerical data frame (matrix) of the difference between fit (product of
   signatures and exposures) and input mutational catalogue
 \item \code{rss}:
   Residual sum of squares (i.e. sum of squares of the residual catalogue)
 \item \code{cosDist_fit_orig_per_matrix}:
   Cosine distance between the fit (product of signatures and exposures) and
   input mutational catalogue computed after putting the matrix into vector
   format (i.e. one scaler product for the whole matrix)
 \item \code{cosDist_fit_orig_per_col}:
   Cosine distance between the fit (product of signatures and exposures) and
   input mutational catalogue computed per column (i.e. per sample, i.e. as
   many scaler products as there are samples in the cohort)
 \item \code{sum_ind}:
   Decreasing order of mutational loads based on the input mutational
   catalogue
 \item \code{out_sig_ind}:
   Data frame of the type \code{signature_indices_df}, i.e. indicating name,
   function and meta-information of the signatures. Default is NULL, 
   non-NULL only if \code{in_sig_ind_df} is non-NULL.
 \item \code{aggregate_exposures_list}:
   List of exposure data frames aggregated over different categories. 
   Default is NULL, non-NULL only if \code{in_sig_ind_df} and 
   \code{in_cat_list} are non-NULL and if the categories specified in 
   \code{in_cat_list} are among the column names of \code{in_sig_ind_df}.
}
}
\description{
\code{LCD_cutoff} performs a mutational signatures decomposition by 
Linear Combination Decomposition (LCD) of a given
mutational catalogue \code{V} with known signatures \code{W} by 
solving the minimization problem \eqn{min(||W*H - V||)} 
with additional constraints of non-negativity on H where W and V
are known, but excludes signatures with an overall contribution less than
a given signature-specific cutoff (and thereby accounting for a background
model) over the whole cohort.

\code{LCD_complex_cutoff_perPID} is a wrapper for
\code{\link{LCD_complex_cutoff}} and runs individually for every PID.
}
\examples{
 NULL

}
\seealso{
\code{\link{LCD}}

\code{\link{aggregate_exposures_by_category}}

\code{\link[lsei]{lsei}}
}

