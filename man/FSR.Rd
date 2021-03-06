\name{FSR}
\alias{FSR}
\alias{print.FSR}
\alias{summary.FSR}

\title{FSR}
\usage{
FSR(Xy, max_poly_degree = 3, max_interaction_degree = 2,
  outcome = NULL, linear_estimation = FALSE,
  threshold_include = 0.01, threshold_estimate = 0.001,
  min_models = NULL, max_fails = 2, standardize = FALSE,
  pTraining = 0.8, file_name = NULL, store_fit = "none",
  max_block = 250, noisy = TRUE, seed = NULL)
\method{summary}{FSR}(object, estimation_overview = TRUE,
  results_overview = TRUE, model_number = NULL, ...)
\method{print}{FSR}(x, ...)
}
\arguments{
\item{Xy}{matrix or data.frame; outcome must be in final column. Categorical variables (> 2 levels) should be passed as factors, not dummy variables or integers, to ensure the polynomial matrix is constructed properly.}

\item{max_poly_degree}{highest power to raise continuous features; default 3 (cubic).}

\item{max_interaction_degree}{highest interaction order; default 2 (allow x_i*x_j). Also interacts each level of factors with continuous features.}

\item{outcome}{Treat y as either 'continuous', 'binary', 'multinomial', or NULL (auto-detect based on response).}

\item{linear_estimation}{Logical: model outcome as linear and estimate with ordinary least squares? Recommended for speed on large datasets even if outcome is categorical. (For multinomial outcome, this means treated response as vector.) If FALSE, estimator chosen based on 'outcome' (i.e., OLS for continuous outcomes, glm() to estimate logistic regression models for 'binary' outcomes, and nnet::multinom() for 'multinomial').}

\item{threshold_include}{minimum improvement to include a recently added term in the model (change in fit originally on 0 to 1 scale). -1.001 means 'include all'. Default: 0.01. (Adjust R^2 for linear models, Pseudo R^2 for logistic regression, out-of-sample accuracy for multinomial models. In latter two cases, the same adjustment for number of predictors is applied as pseudo-R^2.)}

\item{threshold_estimate}{minimum improvement to keep estimating (pseudo R^2 so scale 0 to 1). -1.001 means 'estimate all'. Default: 0.001.}

\item{min_models}{minimum number of models to estimate. Defaults to the number of features (unless P > N).}

\item{max_fails}{maximum number of models to FSR() can fail on computationally before exiting. Default == 2.}

\item{standardize}{if TRUE (not default), standardizes continuous variables.}

\item{pTraining}{portion of data for training}

\item{file_name}{If a file name (and path) is provided, saves output after each model is estimated as an .RData file. ex: file_name = "results.RData". See also store_fit for options as to how much to store in the outputted object.}

\item{store_fit}{If file_name is provided, FSR() will return coefficients, measures of fit, and call details. Save entire fit objects? Options include "none" (default, just save those other items), "accepted_only" (only models that meet the threshold), and "all".}

\item{max_block}{Most of the linear algebra is done recursively in blocks to ease memory managment. Default 250. Changing up or down may slow things...}

\item{noisy}{display measures of fit, progress, etc. Recommended.}

\item{seed}{Automatically set but can also be passed as paramater.}

\item{estimation_overview}{logical: describe how many models were planned, sample size, etc.?}

\item{results_overview}{logical: give overview of best fit model, etc?}

\item{model_number}{If non-null, an integer indicating which model to display a summary of.}
\item{object}{an FSR object, can be used with predict().}
\item{x}{an FSR object, can be used with print().}
\item{...}{ignore.}

}
\value{
list with slope coefficients, model and estimation details, and measures of fit (object of class 'FSR').
}
\description{
FSR
}
\examples{
out <- FSR(mtcars)
}
