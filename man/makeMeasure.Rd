% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Measure.R
\name{makeMeasure}
\alias{makeMeasure}
\alias{Measure}
\title{Construct performance measure.}
\usage{
makeMeasure(id, minimize, properties = character(0L), fun,
  extra.args = list(), aggr = test.mean, best = NULL, worst = NULL,
  name = id, note = "")
}
\arguments{
\item{id}{(`character(1)`)\cr
Name of measure.}

\item{minimize}{(`logical(1)`)\cr
Should the measure be minimized?
Default is `TRUE`.}

\item{properties}{([character])\cr
Set of measure properties. Some standard property names include:
\describe{
  \item{classif}{Is the measure applicable for classification?}
  \item{classif.multi}{Is the measure applicable for multi-class classification?}
  \item{multilabel}{Is the measure applicable for multilabel classification?}
  \item{regr}{Is the measure applicable for regression?}
  \item{surv}{Is the measure applicable for survival?}
  \item{cluster}{Is the measure applicable for cluster?}
  \item{costsens}{Is the measure applicable for cost-sensitive learning?}
  \item{req.pred}{Is prediction object required in calculation? Usually the case.}
  \item{req.truth}{Is truth column required in calculation? Usually the case.}
  \item{req.task}{Is task object required in calculation? Usually not the case}
  \item{req.model}{Is model object required in calculation? Usually not the case.}
  \item{req.feats}{Are feature values required in calculation? Usually not the case.}
  \item{req.prob}{Are predicted probabilities required in calculation? Usually not the case, example would be AUC.}
}
Default is `character(0)`.}

\item{fun}{(`function(task, model, pred, feats, extra.args)`)\cr
Calculates the performance value. Usually you will only need the prediction
object `pred`.
\describe{
  \item{`task` ([Task])}{
    The task.}
  \item{`model` ([WrappedModel])}{
    The fitted model.}
  \item{`pred` ([Prediction])}{
    Prediction object.}
  \item{`feats` ([data.frame])}{
    The features.}
  \item{`extra.args` ([list])}{
    See below.}
}}

\item{extra.args}{([list])\cr
List of extra arguments which will always be passed to `fun`.
Can be changed after construction via [setMeasurePars]<`3`>.
Default is empty list.}

\item{aggr}{([Aggregation])\cr
Aggregation funtion, which is used to aggregate the values measured
on test / training sets of the measure to a single value.
Default is [test.mean].}

\item{best}{(`numeric(1)`)\cr
Best obtainable value for measure.
Default is -`Inf` or `Inf`, depending on `minimize`.}

\item{worst}{(`numeric(1)`)\cr
Worst obtainable value for measure.
Default is `Inf` or -`Inf`, depending on `minimize`.}

\item{name}{([character]) \cr
Name of the measure. Default is `id`.}

\item{note}{([character]) \cr
Description and additional notes for the measure. Default is \dQuote{}.}
}
\value{
[Measure].
}
\description{
A measure object encapsulates a function to evaluate the performance of a prediction.
Information about already implemented measures can be obtained here: [measures].

A learner is trained on a training set d1, results in a model m and predicts another set d2
(which may be a different one or the training set) resulting in the prediction.
The performance measure can now be defined using all of the information of the original task,
the fitted model and the prediction.

Object slots:
\describe{
  \item{id (`character(1)`)}{See argument.}
  \item{minimize (`logical(1)`)}{See argument.}
  \item{properties ([character])}{See argument.}
  \item{fun (`function])}{See argument.}
  \item{extra.args ([list])}{See argument.}
  \item{aggr ([Aggregation])}{See argument.}
  \item{best (`numeric(1)`)}{See argument.}
  \item{worst (`numeric(1)`)}{See argument.}
  \item{name (`character(1)`)}{See argument.}
  \item{note (`character(1)`)}{See argument.}
}
}
\examples{
f = function(task, model, pred, extra.args)
  sum((pred$data$response - pred$data$truth)^2)
makeMeasure(id = "my.sse", minimize = TRUE, properties = c("regr", "response"), fun = f)
}
\seealso{
Other performance: \code{\link{ConfusionMatrix}},
  \code{\link{calculateConfusionMatrix}},
  \code{\link{calculateROCMeasures}},
  \code{\link{estimateRelativeOverfitting}},
  \code{\link{makeCostMeasure}},
  \code{\link{makeCustomResampledMeasure}},
  \code{\link{measures}}, \code{\link{performance}},
  \code{\link{setAggregation}},
  \code{\link{setMeasurePars}}
}
