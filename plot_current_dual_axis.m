function plot_current_dual_axis(t_left, y_left, t_right, y_right, ylims_left, ylims_right, ...
                        panelName, plotName, left_color, right_color, green_color, ...
                        my_fontsize, my_lineWidth, show_xlabel, legend_flag)

    figure();
    set(gcf, 'defaultAxesColorOrder', [left_color; right_color]);

    % Left y-axis
    yyaxis left
    plot(t_left, y_left, 'Color', green_color, 'LineWidth', my_lineWidth)
    axis([t_left(1) t_left(end) ylims_left])
    ylabel('Voltage (mV)', 'FontSize', my_fontsize)
    set(gca, 'FontSize', my_fontsize, 'FontName', 'Times New Roman', 'LineWidth', 2)
    if ~show_xlabel
        set(gca, 'xtick', [])
    else
        xlabel('Time (ms)', 'FontSize', my_fontsize)
    end

    hold on

    % Right y-axis
    yyaxis right
    plot(t_right, y_right, 'Color', right_color, 'LineWidth', my_lineWidth)
    axis([t_left(1) t_left(end) ylims_right])
    ylabel('Current Density (pA/\mu m^2)', 'FontSize', my_fontsize, 'Color', right_color)

    % Panel name and legend
    text(t_left(1) + 30, ylims_right(2)*0.92, panelName, ...
         'fontsize', my_fontsize, 'FontName', 'Helvetica')
    if legend_flag
        legend({'V_{ext}','J_{mf}'}, 'Orientation', 'horizontal', 'Location', 'northoutside', 'FontSize', my_fontsize, 'Box', 'off')
        legend boxoff
    end
    box off
    exportgraphics(gcf, [plotName, '.png']);
end
