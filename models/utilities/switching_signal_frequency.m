function frequency = switching_signal_frequency(signal, time, options)
arguments
    signal double
    time double
    options.WindowSize (1,1) double = 0.05 * (time(end) - time(1))
end

step_size = (time(end) - time(1)) / length(time);
time_new = linspace(0,time(end), length(time)).';

edges = cat(1, abs(signal(2:end) - signal(1:end-1)), 0);

cumulative = cumsum(edges);

cumulative_fixed_step = interp1(time, cumulative, time_new);

cumulative_fixed_step_filtered = movmean(cumulative_fixed_step, options.WindowSize / step_size);

frequency_fixed_step = gradient(cumulative_fixed_step_filtered) / step_size;

frequency = interp1(time_new, frequency_fixed_step, time);
end