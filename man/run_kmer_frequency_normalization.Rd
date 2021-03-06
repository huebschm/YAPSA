% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interact_foreign.R
\name{run_kmer_frequency_normalization}
\alias{run_kmer_frequency_normalization}
\title{Provide normalized correction factors for kmer content}
\usage{
run_kmer_frequency_normalization(in_ref_genome_fasta, in_target_capture_bed,
  in_word_length, project_folder, in_verbose = 1)
}
\arguments{
\item{in_ref_genome_fasta}{Path to the reference genome fasta file used.}

\item{in_target_capture_bed}{Path to a bed file containing the information on the used target capture. 
May also be a compressed bed.}

\item{in_word_length}{Integer number defining the length of the features or motifs, e.g. 3 for
tripletts or 5 for pentamers}

\item{project_folder}{Path where the created files, especially the fasta file with the sequence 
of the target capture and the count matrices, can be stored.}

\item{in_verbose}{Verbose if \code{in_verbose=1}}
}
\value{
A numeric vector with correction factors
}
\description{
This function is analogous to 
\code{\link[SomaticSignatures]{normalizeMotifs}}. If an 
analysis of mutational signatures is performed on e.g. Whole Exome 
Sequencing (WES) data, the signatures and exposures have to be adapted to 
the potentially different kmer (trinucleotide) content of the target 
capture. The present function takes as arguments paths to the used reference
genome and target capture file. It the extracts the sequence of the target 
capture by calling \code{bedtools getfasta} on the system command prompt. 
\code{run_kmer_frequency_normalization} then calls a custom made perl script
\code{kmer_frequencies.pl} also included in this package to count the 
occurences of the tripletts in both the whole reference genome and the 
created target capture sequence. These counts are used for normalization as 
in \code{\link[SomaticSignatures]{normalizeMotifs}}. Note that
\code{\link[SomaticSignatures]{kmerFrequency}} provides a solution to 
approximate kmer frequencies by random sampling. As opposed to that 
approach, the function described here deterministically counts all 
occurences of the kmers in the respective genome.
}
\examples{
 NULL

}
\seealso{
\code{\link[SomaticSignatures]{normalizeMotifs}}
}

