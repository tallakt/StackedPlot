module StackedPlot

using Plots

export plotstacked, trace

function plotstacked(x, traces...; kwargs...)
  n = length(traces)
  subplots = map(t -> Plots.plot(x, t[1]; t[3]..., kwargs..., showaxis = :y), traces[1:end-1])
  bottomplot = Plots.plot(x, traces[end][1]; traces[end][3]..., kwargs..., showaxis = :xy);
  heights = map(t -> t[2], traces);
  normalized_heights = heights ./ sum(heights);
  layout = n < 2 ? grid(1,1) : grid(n, 1, heights = normalized_heights)
  Plots.plot(subplots..., bottomplot, layout = layout)  
end


function trace(y, height = 1.0; kwargs...)
  (y, height, kwargs)
end

end
