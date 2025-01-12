% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/position-nudge-to.R
\name{position_nudge_to}
\alias{position_nudge_to}
\title{Nudge labels to new positions}
\usage{
position_nudge_to(
  x = NULL,
  y = NULL,
  x.action = c("none", "spread"),
  y.action = c("none", "spread"),
  kept.origin = c("original", "none")
)
}
\arguments{
\item{x, y}{Coordinates of the destination position. A vector of mode
\code{numeric}, that is extended if needed, to the same length as rows
there are in \code{data}. The values are applied in the order of the
observations in data. The default, \code{NULL}, leaves the original
coordinates unchanged.}

\item{x.action, y.action}{character string, one of \code{"none"}, or
\code{"spread"}. With \code{"spread"} evenly distributing the positions
within the range of argument \code{x} or \code{y}, if non-null, or the
range the variable mapped to \emph{x} or \code{y}, otherwise.}

\item{kept.origin}{One of \code{"original"} or \code{"none"}.}
}
\value{
A \code{"Position"} object.
}
\description{
\code{position_nudge_to()} is generally useful for adjusting the position of
labels or text, both on a discrete or continuous scale.
\code{position_nudge_to()} differs from \code{\link[ggplot2]{position_nudge}}
in that the coordinates of the new position are given directly, rather than
as a displacement from the original location. It optionally sets an even
distance among positions. As other position functions in this package, it
preserves the original position to allow the text to be linked back to its
original position with a segment or arrow.
}
\details{
The nudged \code{x} or \code{y} replace the original ones in
  \code{data}, while the original coordinates are returned in \code{x_orig}
  and \code{y_orig}. Values supported are those of \emph{mode} numeric,
  thus including dates and times.
}
\note{
Irrespective of the action, the ordering of rows in \code{data} is
  preserved.
}
\examples{
df <- data.frame(
  x = c(1,3,2,5,4,2.5),
  y = c(2, 1, 2.5, 1.8, 2.8, 1.5),
  label = c("abc","cd","d","c","bcd","a")
)

ggplot(df, aes(x, y, label = label)) +
  geom_point() +
  geom_text(position = position_nudge_to(y = 3))

ggplot(df, aes(x, y, label = label)) +
  geom_point() +
  geom_text_s(position = position_nudge_to(y = 3))

ggplot(df, aes(x, y, label = label)) +
  geom_point() +
  geom_text_s(position =
    position_nudge_to(y = 3, x.action = "spread"))

ggplot(df, aes(x, y, label = label)) +
  geom_point() +
  geom_text_s(position =
    position_nudge_to(y = 3, x = c(2,4), x.action = "spread"),
    hjust = "center")

}
\seealso{
\code{\link[ggplot2]{position_nudge}},
  \code{\link[ggrepel]{position_nudge_repel}}.

Other position adjustments: 
\code{\link{position_dodgenudge}()},
\code{\link{position_jitternudge}()},
\code{\link{position_nudge_center}()},
\code{\link{position_nudge_line}()},
\code{\link{position_stacknudge}()}
}
\concept{position adjustments}
