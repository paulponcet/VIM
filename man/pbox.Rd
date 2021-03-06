% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pbox.R
\name{pbox}
\alias{pbox}
\title{Parallel boxplots with information about missing/imputed values}
\usage{
pbox(x, delimiter = NULL, pos = 1, selection = c("none", "any", "all"),
  col = c("skyblue", "red", "red4", "orange", "orange4"), numbers = TRUE,
  cex.numbers = par("cex"), xlim = NULL, ylim = NULL, main = NULL,
  sub = NULL, xlab = NULL, ylab = NULL, axes = TRUE,
  frame.plot = axes, labels = axes, interactive = TRUE, ...)
}
\arguments{
\item{x}{a vector, matrix or \code{data.frame}.}

\item{delimiter}{a character-vector to distinguish between variables and
imputation-indices for imputed variables (therefore, \code{x} needs to have
\code{\link{colnames}}). If given, it is used to determine the corresponding
imputation-index for any imputed variable (a logical-vector indicating which
values of the variable have been imputed). If such imputation-indices are
found, they are used for highlighting and the colors are adjusted according
to the given colors for imputed variables (see \code{col}).}

\item{pos}{a numeric value giving the index of the variable of interest.
Additional variables in \code{x} are used for grouping according to
missingness/number of imputed missings.}

\item{selection}{the selection method for grouping according to
missingness/number of imputed missings in multiple additional variables.
Possible values are \code{"none"} (grouping according to missingness/number
of imputed missings in every other variable that contains missing/imputed
values), \code{"any"} (grouping according to missingness/number of imputed
missings in \emph{any} of the additional variables) and \code{"all"}
(grouping according to missingness/number of imputed missings in \emph{all}
of the additional variables).}

\item{col}{a vector of length five giving the colors to be used in the plot.
The first color is used for the boxplots of the available data, the
second/fourth are used for missing/imputed data, respectively, and the
third/fifth color for the frequencies of missing/imputed values in both
variables (see \sQuote{Details}).  If only one color is supplied, it is used
for the boxplots for missing/imputed data, whereas the boxplots for the
available data are transparent.  Else if two colors are supplied, the second
one is recycled.}

\item{numbers}{a logical indicating whether the frequencies of
missing/imputed values should be displayed (see \sQuote{Details}).}

\item{cex.numbers}{the character expansion factor to be used for the
frequencies of the missing/imputed values.}

\item{xlim, ylim}{axis limits.}

\item{main, sub}{main and sub title.}

\item{xlab, ylab}{axis labels.}

\item{axes}{a logical indicating whether axes should be drawn on the plot.}

\item{frame.plot}{a logical indicating whether a box should be drawn around
the plot.}

\item{labels}{either a logical indicating whether labels should be plotted
below each box, or a character vector giving the labels.}

\item{interactive}{a logical indicating whether variables can be switched
interactively (see \sQuote{Details}).}

\item{\dots}{for \code{pbox}, further arguments and graphical parameters to
be passed to \code{\link[graphics]{boxplot}} and other functions.  For
\code{TKRpbox}, further arguments to be passed to \code{pbox}.}
}
\value{
a list as returned by \code{\link[graphics]{boxplot}}.
}
\description{
Boxplot of one variable of interest plus information about missing/imputed
values in other variables.
}
\details{
This plot consists of several boxplots. First, a standard boxplot of the
variable of interest is produced. Second, boxplots grouped by observed and
missing/imputed values according to \code{selection} are produced for the
variable of interest.

Additionally, the frequencies of the missing/imputed values can be
represented by numbers.  If so, the first line corresponds to the observed
values of the variable of interest and their distribution in the different
groups, the second line to the missing/imputed values.

If \code{interactive=TRUE}, clicking in the left margin of the plot results
in switching to the previous variable and clicking in the right margin
results in switching to the next variable.  Clicking anywhere else on the
graphics device quits the interactive session.
}
\note{
Some of the argument names and positions have changed with version 1.3
due to extended functionality and for more consistency with other plot
functions in \code{VIM}.  For back compatibility, the arguments \code{names}
and \code{cex.text} can still be supplied to \code{\dots{}} and are handled
correctly.  Nevertheless, they are deprecated and no longer documented.  Use
\code{labels} and \code{cex.numbers} instead.
}
\examples{

data(chorizonDL, package = "VIM")
## for missing values
pbox(log(chorizonDL[, c(4,5,8,10,11,16:17,19,25,29,37,38,40)]))

## for imputed values
pbox(kNN(log(chorizonDL[, c(4,8,10,11,17,19,25,29,37,38,40)])),
     delimiter = "_imp")

}
\references{
M. Templ, A. Alfons, P. Filzmoser (2012) Exploring incomplete
data using visualization tools.  \emph{Journal of Advances in Data Analysis
and Classification}, Online first. DOI: 10.1007/s11634-011-0102-y.
}
\seealso{
\code{\link{parcoordMiss}}
}
\author{
Andreas Alfons, Matthias Templ, modifications by Bernd Prantner
}
\keyword{hplot}
