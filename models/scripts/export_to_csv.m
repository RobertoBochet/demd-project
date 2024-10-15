%% uncontrolled system response

t = out.tout;
t_n = linspace(t(1), t(end), 200);

data = [
    t_n
    interp1(out.speed.Time, out.speed.Data, t_n)
]';

data_names = {
    't'
    'wm'
    };

data_table = array2table(data, 'VariableNames', data_names);

writetable(data_table, "../report/data/uncontrolled_response.csv");

%% controlled system response

t = out.tout;
t_n = linspace(t(1), t(end), 200);

data = [
    t_n
    interp1(out.speed.Time, out.speed.Data, t_n)
]';

data_names = {
    't'
    'wm'
    };

data_table = array2table(data, 'VariableNames', data_names);

writetable(data_table, "../report/data/controlled_response.csv");

%% controlled system in response at assigned task

t = out.tout;
t_n = linspace(t(1), t(end), 2000);

data = [
    t_n
    interp1(out.speed_reference.Time, out.speed_reference.Data, t_n)
    interp1(out.speed.Time, out.speed.Data, t_n)
    interp1(out.torque.Time, out.torque.Data, t_n)
    interp1(out.torque_load.Time, out.torque_load.Data, t_n)
    interp1(out.Sa.Time, switching_signal_frequency(out.Sa.Data, out.Sa.Time, 'WindowSize', 0.001)', t_n)
    interp1(out.Sb.Time, switching_signal_frequency(out.Sb.Data, out.Sb.Time, 'WindowSize', 0.001)', t_n)
    interp1(out.Sc.Time, switching_signal_frequency(out.Sc.Data, out.Sc.Time, 'WindowSize', 0.001)', t_n)
    interp1(out.voltage.Time, real(out.voltage.Data), t_n)
    interp1(out.voltage.Time, imag(out.voltage.Data), t_n)
    interp1(out.current_stator.Time, real(out.current_stator.Data), t_n)
    interp1(out.current_stator.Time, imag(out.current_stator.Data), t_n)
    interp1(out.flux_stator.Time, real(out.flux_stator.Data), t_n)
    interp1(out.flux_stator.Time, imag(out.flux_stator.Data), t_n)
    interp1(out.flux_rotor.Time, real(out.flux_rotor.Data), t_n)
    interp1(out.flux_rotor.Time, imag(out.flux_rotor.Data), t_n)
]';

data_names = {
    't'
    'wm_ref'
    'wm'
    'Te'
    'Tl'
    'f_Sa'
    'f_Sb'
    'f_Sc'
    'Vs_a'
    'Vs_b'
    'Is_a'
    'Is_b'
    'Psis_a'
    'Psis_b'
    'Psir_a'
    'Psir_b'
    };

data_table = array2table(data, 'VariableNames', data_names);

writetable(data_table, "../report/data/assigned_task.csv");
