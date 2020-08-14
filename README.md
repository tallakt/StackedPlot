# StackedPlot


`StackedPlot` is a Julia package to plot many traces in a single plot, with
the same x-axis scaling. Typically you could plot many time series stacked on
top of each other, with a common time scale x-axis at the bottom.

![Example Plot](/docs/plot.svg)

## Installation

```
$ ] add https://github.com/tallakt/StackedPlot.git
```

## Usage

A simple usage of `plotstacked` is

```julia
t = 0:0.01:10
plotstacked(t, trace(sin.(t)), trace(cos.(t)), trace(tan.(t)))
```

You can add named parameters to every call to `trace(...)` and these are passed
on to the call to `plot(...)`. Like:

```julia
t = 0:0.01:10
plotstacked(t, trace(sin.(t), label="sin"), trace(cos.(t), label="cos"), trace(tan.(t), label="tan"))
```

`trace` has a second optional parameter to change the relative height of the plots. 
The default height weight is `1.0`.

```julia
t = 0:0.01:10
plotstacked(t, trace(sin.(t), 2.0, label="sin"), trace(cos.(t), label="cos"), trace(tan.(t), label="tan"))
```

To add a parameter to all the traces, you may add this to the `plotstacked(...)` call


```julia
t = 0:0.01:10
plotstacked(t, trace(sin.(t)), trace(cos.(t)), trace(tan.(t)), ylims=(-1,1), legend=false)
```


