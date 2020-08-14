module StackedPlot

export plotstacked, trace

function plotstacked(x, traces...; kwargs...)
  n = length(traces)
  subplots = map(t -> plot(x, t[1]; t[3]..., kwargs..., xaxis=false), traces[1:end-1])
  bottomplot = plot(x, traces[end][1]; traces[end][3]..., kwargs..., xaxis = true);
  heights = map(t -> t[2], traces);
  normalized_heights = heights ./ sum(heights);
  layout = grid(n, 1, heights = normalized_heights)
  plot(subplots..., bottomplot, layout = layout)  
end


function trace(y, height = 1.0; kwargs...)
  (y, height, kwargs)
end

end