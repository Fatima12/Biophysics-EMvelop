function plot_voltage_comparison(t1, V1, greenColor, t2, V2, blueColor,...
    my_lineWidth, min_y, max_y, my_fontsize, x_label_flag, legend_flag, panelName, plotName)

    figure();
    plot(t1, V1, 'Color', greenColor , 'LineWidth', my_lineWidth)
    hold on
    plot(t2, V2 ,'Color', blueColor , 'LineWidth', my_lineWidth)
    axis([t1(1) t1(end) min_y max_y])
    set(gca,'FontSize', my_fontsize, 'FontName', 'Times New Roman', 'LineWidth', my_lineWidth) 
    if ~x_label_flag
        set(gca,'xtick',[])
    else
        xlabel('Time (ms)','FontSize',22)
    end
    ylabel('Voltage (mV)','FontSize', my_fontsize);
    text(30, max_y, panelName, 'fontsize', my_fontsize,'FontName','Helvetica')
    if legend_flag
       legend('V_{ext}', 'V_f', 'Orientation', 'horizontal', 'Location' , 'northoutside');
       legend boxoff
    end
    box off
    exportgraphics(gcf, [plotName,'.png']);
    
end