# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Package Overview

`periodicAR` is an R package for identification, estimation, and diagnostic checking of **Periodic Autoregressive (PAR)** models — time series models where the autoregressive structure varies by season/period. The package implements the Yule-Walker estimation approach.

## Development Commands

This package uses `devtools`. Common workflows from within R:

```r
devtools::load_all()      # Load package for interactive development
devtools::document()      # Regenerate man/ from roxygen2 comments
devtools::check()         # Full R CMD check
devtools::build()         # Build tarball
devtools::install()       # Install locally
```

From the shell:
```sh
R CMD build .
R CMD check periodicAR_*.tar.gz
R CMD INSTALL .
```

There is no test suite (`tests/` directory does not exist).

## Architecture

All functions require input `z` to be an R `ts` object with a `frequency` attribute (the period `p`). The period drives all computations via `cycle(z)` and `attr(z, "tsp")[3]`.

### Call hierarchy

```
periodicAR()          # Main: fit PAR model, Yule-Walker estimation
  └── peacf()         # Periodic ACF (foundational — called by nearly everything)
        └── peacf.plot()   # Plots ACF or PACF output
  └── pepacf()        # Periodic PACF via Levinson-Durbin-like recursion
        └── peacf()
        └── find.ice()     # Selects optimal per-season order from AIC/BIC matrix
  └── pepsi()         # Computes MA(∞) psi-weights from PAR phi matrix
```

### Key functions

| Function | Role |
|---|---|
| `peacf(z, lag.max, plot)` | Periodic sample ACF; returns means, SDs, ACF matrix, portmanteau tests |
| `pepacf(z, lag.max, plot, acf.out)` | Periodic sample PACF; also returns AIC/BIC and optimal orders `maice`/`mbice` |
| `periodicAR(z, m, ic)` | Fit PAR model; `m` is per-season order vector; `ic="aic"` or `ic="bic"` for automatic selection |
| `peplot(z, lag, label, mfrow)` | Periodic scatter plots (z_t vs z_{t-lag} by season) |
| `peboxplot(z, ...)` | Boxplots split by season |
| `peacf.plot(r)` | Plot method for `peacf`/`pepacf` output objects |
| `pepsi(phi, lag.max)` | MA(∞) psi-weight matrix from PAR phi matrix |
| `find.ice(aic)` | Finds per-row minimum column index (first argmin per season) from IC matrix |
| `var.periodic.correlation(l, m, n, p)` | Asymptotic variance of periodic correlation at lag `l`, season `m` |

### Data

- `data/ozone.rda` — monthly ozone concentrations (seasonal ts)
- `data/Fraser.rda` — Fraser River flow data (seasonal ts)

### Conventions

- Code uses tabs (displayed as 2 spaces per `.Rproj` config)
- Functions are defined with backtick syntax: `` `fname` <- function(...) ``
- Documentation is in `man/*.Rd` files; roxygen2 (`RoxygenNote: 7.2.3`) is used to regenerate them
- `NAMESPACE` imports the full `graphics`, `stats`, and `utils` namespaces
